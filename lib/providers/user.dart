import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/player.dart';
import '../utils/hypixel_api_wrapper.dart';

class UserProvider with ChangeNotifier {
  late String _uuid;
  late String username;
  Uint8List? avatar;

  late String apiKey;
  late Player player;

  bool isUuidSet = false;
  bool isApiSet = false;
  bool isUserSet = false;

  Future<void> setMcUserData(String username) async {
    try {
      final uuidData = await HttpRequests().getUuidFromUsername(username);

      avatar = await HttpRequests().getUserAvatar(uuidData['id']);
      this.username = uuidData['name'];
      _uuid = uuidData['id'];

      isUuidSet = true;
      if (isApiSet) {
        await setHypixelUserData(apiKey); //refresh hypixel player data if api key is set
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> setHypixelUserData(String apiKey) async {
    if (!isUuidSet) {
      return;
    }
    try {
      final data = await HttpRequests().getHypixelPlayerData(apiKey, _uuid);

      player = Player.fromRawData(username: username, data: data);
      this.apiKey = apiKey;
      isApiSet = true;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> saveUserData() async {
    if (!isUuidSet || !isApiSet) {
      return;
    }

    try {
      final preferences = await SharedPreferences.getInstance();
      final userData = json.encode({
        '_uuid': _uuid,
        'apiKey': apiKey,
      });
      preferences.setString('userData', userData);

      isUserSet = true;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance(); //TODO: may fail ?
    preferences.clear();
    isUuidSet = false;
    isApiSet = false;
    isUserSet = false;
    notifyListeners();
  }

  Future<bool> getUserData() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      if (!preferences.containsKey('userData')) {
        throw 'Data not set';
      }
      final userData = json.decode(preferences.getString('userData')!) as Map<String, dynamic>;

      if (userData.containsKey('_uuid') && userData.containsKey('apiKey')) {
        _uuid = userData['_uuid'];
        apiKey = userData['apiKey'];
      } else {
        throw 'Data not set';
      }

      final data = await HttpRequests().getUsernameFromUuid(_uuid);
      if (data.containsKey('name')) {
        username = data['name'];
      } else {
        throw 'Wrong _uuid';
      }

      avatar = await HttpRequests().getUserAvatar(userData['_uuid']);
      isUuidSet = true;

      await setHypixelUserData(apiKey);

      isUserSet = true;
      notifyListeners();
      return true;
    } catch (error) {
      logout();
      return false; //TODO: throw all errors and remove return statement
    }
  }
}
