import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/player.dart';
import '../utils/hypixel_api_wrapper.dart';

class UserProvider with ChangeNotifier {
  late String uuid;
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

      //avatar = await HttpRequests().getUserAvatar(uuidData['id']);
      avatar = Uint8List.fromList([
        137,
        80,
        78,
        71,
        13,
        10,
        26,
        10,
        0,
        0,
        0,
        13,
        73,
        72,
        68,
        82,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        8,
        8,
        2,
        0,
        0,
        0,
        75,
        109,
        41,
        220,
        0,
        0,
        0,
        107,
        73,
        68,
        65,
        84,
        8,
        29,
        99,
        252,
        254,
        253,
        59,
        3,
        3,
        3,
        7,
        7,
        7,
        144,
        132,
        131,
        151,
        47,
        95,
        178,
        64,
        132,
        116,
        20,
        120,
        128,
        162,
        63,
        126,
        254,
        5,
        146,
        119,
        158,
        131,
        148,
        50,
        254,
        255,
        255,
        223,
        218,
        64,
        232,
        227,
        135,
        95,
        112,
        9,
        136,
        28,
        163,
        149,
        190,
        32,
        144,
        5,
        148,
        128,
        40,
        7,
        178,
        33,
        128,
        9,
        72,
        245,
        94,
        120,
        3,
        227,
        130,
        232,
        37,
        207,
        191,
        2,
        73,
        144,
        196,
        67,
        134,
        255,
        32,
        1,
        24,
        128,
        112,
        113,
        26,
        5,
        181,
        28,
        166,
        26,
        100,
        25,
        144,
        125,
        229,
        193,
        23,
        0,
        79,
        2,
        53,
        231,
        251,
        43,
        222,
        206,
        0,
        0,
        0,
        0,
        73,
        69,
        78,
        68,
        174,
        66,
        96,
        130
      ]);

      this.username = uuidData['name'];
      uuid = uuidData['id'];

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
      final data = await HttpRequests().getHypixelPlayerData(apiKey, uuid);

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
        'uuid': uuid,
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

      if (userData.containsKey('uuid') && userData.containsKey('apiKey')) {
        uuid = userData['uuid'];
        apiKey = userData['apiKey'];
      } else {
        throw 'Data not set';
      }

      final data = await HttpRequests().getUsernameFromUuid(uuid);
      if (data.containsKey('name')) {
        username = data['name'];
      } else {
        throw 'Wrong uuid';
      }

      avatar = await HttpRequests().getUserAvatar(userData['uuid']);
      isUuidSet = true;

      await setHypixelUserData(apiKey);

      isUserSet = true;
      notifyListeners();
      print('ok');
      return true;
    } catch (error) {
      logout();
      print('not ok');
      return false; //TODO: throw all errors and remove return statement
    }
  }
}
