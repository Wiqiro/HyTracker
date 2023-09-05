import 'package:flutter/material.dart';
import 'package:hytracker/models/player.dart';
import 'package:hytracker/providers/user.dart';
import 'package:hytracker/utils/hypixel_api_wrapper.dart' as wrapper;
import 'package:provider/provider.dart';

import 'stat_record.dart';
import '../utils/game_types.dart';

class Session {
  final DateTime startTime = DateTime.now();
  DateTime? endTime;

  bool hasFinished = false;

  StatRecord? firstRecord;
  StatRecord? lastRecord;

  Future<void> refresh(BuildContext context) async {}
}
