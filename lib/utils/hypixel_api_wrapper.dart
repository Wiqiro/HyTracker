import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class HttpRequests {
  Future<Map<String, dynamic>> getUuidFromUsername(String username) async {
    try {
      final url = 'https://api.mojang.com/users/profiles/minecraft/$username';
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as Map<String, dynamic>;

      if (data.containsKey('id') && data.containsKey('name')) {
        return data;
      } else {
        throw 'Player does not exist';
      }
    } catch (error) {
      if (error.toString().compareTo('Player does not exist') == 0) {
        rethrow;
      } else {
        throw 'Couldn\'t get minecraft username';
      }
    }
  }

  Future<Map<String, dynamic>> getUsernameFromUuid(String uuid) async {
    try {
      final url = 'https://api.mojang.com/user/profile/$uuid';
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (data.containsKey('id') && data.containsKey('name')) {
        return data;
      } else {
        throw 'Couldn\'t find player';
      }
    } catch (error) {
      if (error.toString().compareTo('Couldn\'t find player') == 0) {
        rethrow;
      } else {
        throw 'Couldn\'t get minecraft uuid';
      }
    }
  }

  Future<Uint8List> getUserAvatar(String uuid) async {
    try {
      final url = 'https://crafatar.com/avatars/$uuid?size=8&overlay';
      //final url = 'https://minotar.net/helm/$uuid';
      final data = await http.get(Uri.parse(url));

      return data.bodyBytes;
    } catch (error) {
      throw 'Couldn\'t get player avatar';
    }
  }

  Future<Map<String, dynamic>> getHypixelPlayerData(String apiKey, String uuid) async {
    try {
      final url = 'https://api.hypixel.net/player?key=$apiKey&uuid=$uuid';
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as Map<String, dynamic>;

      if (data.containsKey('success') && data['success']) {
        return data;
      } else {
        throw data['cause'];
      }
    } catch (error) {
      if (error.toString().compareTo('Invalid API key') == 0) {
        rethrow;
      } else {
        throw 'Couldn\'t  get Hypixel player data';
      }
    }
  }
}
