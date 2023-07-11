import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class HttpRequests {
  Future<Map<String, dynamic>> getUuidFromUsername(String username) async {
    try {
      final url = 'https://api.mojang.com/users/profiles/minecraft/$username';
      final response = await http.get(Uri.parse(url));
      final uuidData = json.decode(response.body) as Map<String, dynamic>;
      //TODO: handle error responses
      return uuidData;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUsernameFromUuid(String uuid) async {
    try {
      final url = 'https://api.mojang.com/user/profile/$uuid';
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as Map<String, dynamic>;
      //TODO: handle error responses
      return data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Uint8List> getUserAvatar(String uuid) async {
    try {
      //final url = 'https://crafatar.com/avatars/$uuid?size=8&default=MHF_Steve&overlay';
      final url = 'https://minotar.net/helm/$uuid';
      final data = await http.get(Uri.parse(url));
      //TODO: handle error responses
      return data.bodyBytes;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getHypixelPlayerData(String apiKey, String uuid) async {
    try {
      final url = 'https://api.hypixel.net/player?key=$apiKey&uuid=$uuid';
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (!data['success']) {
        throw data['cause'];
      }
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
