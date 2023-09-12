import 'package:flutter/material.dart';
import 'package:hytracker/models/player.dart';
import 'package:hytracker/providers/user.dart';
import 'package:hytracker/utils/hypixel_api_wrapper.dart' as wrapper;
import 'package:provider/provider.dart';

class Session {
  final DateTime startTime = DateTime.now();
  DateTime? endTime;

  List<Player> _records = [];

  List<Player> get records {
    return [..._records];
  }

  Session();

  Future<void> refresh(BuildContext context) async {
    try {
      var data = await wrapper.getHypixelPlayerData(
        Provider.of<UserProvider>(context, listen: false).apiKey,
        Provider.of<UserProvider>(context, listen: false).uuid,
      );
      if (!context.mounted) return;
      _records
          .add(Player.fromRawData(username: Provider.of<UserProvider>(context, listen: false).username, data: data));
    } catch (error) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'records': _records.map((player) => player.toJson()).toList(),
    };
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    final session = Session();
    session.endTime = json['endTime'] != null ? DateTime.parse(json['endTime']) : null;
    session._records = (json['records'] as List<dynamic>).map((recordJson) => Player.fromJson(recordJson)).toList();
    return session;
  }

  void end() {
    endTime = DateTime.now();
  }

  bool get isActive {
    return endTime == null;
  }
}
