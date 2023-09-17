import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/session.dart';

class SessionsProvider with ChangeNotifier {
  List<Session> _sessions = [];

  List<Session> get sessions {
    return [..._sessions];
  }

  Future<void> addSession(Session session) async {
    _sessions.add(session);
    try {
      final preferences = await SharedPreferences.getInstance();
      preferences.setString('sessions', json.encode(_sessions.map((session) => session.toJson()).toList()));

      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> loadSavedSessions() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey('sessions')) {
        final decodedSessions = json.decode(preferences.getString('sessions')!) as List<dynamic>;
        _sessions = decodedSessions.map((session) {
          return Session.fromJson(session as Map<String, dynamic>);
        }).toList();
      }
    } catch (_) {
      rethrow;
    }
  }
}
