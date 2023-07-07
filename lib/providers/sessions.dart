import 'package:flutter/material.dart';

import '../models/session.dart';

class SessionsProvider with ChangeNotifier {
  List<Session> _sessions = [];

  List<Session> get sessions {
    return [..._sessions];
  }
}
