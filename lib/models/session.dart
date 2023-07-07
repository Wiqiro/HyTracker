import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'stat_record.dart';
import '../utils/game_types.dart';
import '../providers/user.dart';

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

  Future<void> addStatRecord(BuildContext context) async {
    final apiKey = Provider.of<UserProvider>(context, listen: false).apiKey;
    final uuid = Provider.of<UserProvider>(context, listen: false).uuid;

    final url = Uri.parse(
      'https://api.hypixel.net/player?key=$apiKey&uuid=$uuid',
    );

    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
    } catch (error) {
      rethrow;
    }
  }
}
