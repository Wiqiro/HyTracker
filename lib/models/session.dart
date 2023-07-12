import 'package:flutter/material.dart';

import 'stat_record.dart';
import '../utils/game_types.dart';

class Session {
  final String id;
  final String playerUuid;
  final GameTypes gameType;
  final DateTime startTime;
  DateTime? endTime;

  bool stopDeath = false;
  DateTime? timerDuration;
  String? goalName;
  int? goalValue;

  List<StatRecord> _records = [];

  Session({
    required this.id,
    required this.playerUuid,
    required this.gameType,
    required this.startTime,
    stopDeath,
    timerDuration,
    goalName,
    goalValue,
  });

  List<StatRecord> get records {
    return [..._records];
  }

  Future<void> addStatRecord(BuildContext context) async {}
}
