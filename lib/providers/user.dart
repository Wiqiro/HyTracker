import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/player.dart';
import '../utils/hypixel_api_wrapper.dart' as wrapper;

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
      final uuidData = await wrapper.getUuidFromUsername(username);

      avatar = await wrapper.getUserAvatar(uuidData['id']);
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
      final data = await wrapper.getHypixelPlayerData(apiKey, _uuid);

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
        'uuid': _uuid,
        'apiKey': apiKey,
      });
      preferences.setString('userData', userData);

      isUserSet = true;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      preferences.clear();
    } catch (error) {
      rethrow;
    } finally {
      isUuidSet = false;
      isApiSet = false;
      isUserSet = false;
      notifyListeners();
    }
  }

  Future<void> tryAutoLogin() async {
    try {
      final preferences = await SharedPreferences.getInstance();

      if (!preferences.containsKey('userData')) {
        throw 'No previous login';
      }
      final userData = json.decode(preferences.getString('userData')!) as Map<String, dynamic>;
      if (userData.containsKey('uuid') && userData.containsKey('apiKey')) {
        _uuid = userData['uuid'];
        apiKey = userData['apiKey'];
      } else {
        throw 'No previous login';
      }

      final data = await wrapper.getUsernameFromUuid(_uuid);
      username = data['name'];

      avatar = await wrapper.getUserAvatar(userData['uuid']);
      isUuidSet = true;

      await setHypixelUserData(apiKey);

      isUserSet = true;
      notifyListeners();
    } catch (error) {
      logout();
      rethrow;
    }
  }
}
