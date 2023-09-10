import 'package:flutter/material.dart';

import '../models/session.dart';

class SessionsProvider with ChangeNotifier {
  List<Session> _sessions = [];

  List<Session> get sessions {
    return [..._sessions];
  }

  void addSession(Session session) {
    _sessions.add(session);
    notifyListeners();
  }
}
