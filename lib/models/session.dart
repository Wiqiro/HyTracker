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

  Future<void> refresh(BuildContext context) async {
    print("hi");
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

  void end() {
    endTime = DateTime.now();
  }

  bool get isActive {
    return endTime == null;
  }
}
