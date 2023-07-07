import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/hypixel_api_wrapper.dart';
import '../utils/ranks.dart';

class UserProvider with ChangeNotifier {
  String? uuid;
  String? username;
  Uint8List? avatar;

  String? apiKey;
  Ranks? rank;
  String? plusColor;
  String? mvpPlusPlusColor;

  bool isUuidSet = false;
  bool isApiSet = false;
  bool isUserSet = false;

  Future<void> setMcUserData(String username) async {
    try {
      final uuidData = await HttpRequests().getUuidFromUsername(username);

      avatar = await HttpRequests().getUserAvatar(uuidData['id']);
      this.username = uuidData['name'];
      uuid = uuidData['id'];

      isUuidSet = true;
      if (isApiSet) {
        await setHypixelUserData(apiKey!); //refresh hypixel player data if api key is set
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
      final data = await HttpRequests().getHypixelPlayerData(apiKey, uuid!);

      if (data['player'].containsKey('prefix')) {
        switch (data['player']['prefix']) {
          case '§d[PIG§b+++§d]':
            rank = Ranks.pigPlusPlusPlus;
            break;
          case '§c[OWNER]':
            rank = Ranks.owner;
            break;
          case '§6[MOJANG]':
            rank = Ranks.mojang;
            break;
          case '§6[EVENTS]':
            rank = Ranks.events;
            break;
          default:
            rank = Ranks.none;
            break;
        }
      } else if (data['player'].containsKey('rank')) {
        switch (data['player']['rank']) {
          case 'GAME_MASTER':
            rank = Ranks.gameMaster;
            break;
          case 'ADMIN':
            rank = Ranks.admin;
            break;
          case 'YOUTUBER':
            rank = Ranks.youtube;
            break;
          default:
            rank = Ranks.none;
            break;
        }
      } else if (data['player'].containsKey('newPackageRank')) {
        switch (data['player']['newPackageRank']) {
          case 'VIP':
            rank = Ranks.vip;
            break;
          case 'VIP_PLUS':
            rank = Ranks.vipPlus;
            break;
          case 'MVP':
            rank = Ranks.mvp;
            break;
          case 'MVP_PLUS':
            if (data['player'].containsKey('monthlyPackageRank') &&
                data['player']['monthlyPackageRank'] == 'SUPERSTAR') {
              rank = Ranks.mvpPlusPlus;
              if (data['player'].containsKey('monthlyRankColor')) {
                mvpPlusPlusColor = data['player']['monthlyRankColor'];
              }
            } else {
              rank = Ranks.mvpPlus;
            }
            if (data['player'].containsKey('rankPlusColor')) {
              plusColor = data['player']['rankPlusColor'];
            } else {
              plusColor = 'RED';
            }
            break;
          default:
            rank = Ranks.none;
            break;
        }
      } else {
        rank = Ranks.none;
      }
      this.apiKey = apiKey;
      isApiSet = true;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
    print('Hypixel data set with api key $apiKey');
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
      print(userData);
      preferences.setString('userData', userData);

      isUserSet = true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> getUserData() async {
    print('reloading');
    final preferences = await SharedPreferences.getInstance(); //TODO: may fail ?
    /* preferences.clear(); */
    try {
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

      final data = await HttpRequests().getUsernameFromUuid(uuid!);
      if (data.containsKey('name')) {
        username = data['name'];
      } else {
        throw 'Wrong uuid';
      }

      avatar = await HttpRequests().getUserAvatar(userData['uuid']);
      isUuidSet = true;

      await setHypixelUserData(apiKey!);

      isUserSet = true;
      notifyListeners();

      return true;
    } catch (error) {
      if (error == 'Invalid API key') {
        preferences.clear(); //TODO: clean only wrong data
      }
      return false;
    }
  }
}
