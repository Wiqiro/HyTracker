import 'package:flutter/material.dart';
import 'package:hytracker/utils/game_types.dart';
import 'package:hytracker/widgets/chrono.dart';

import '../widgets/profile_options.dart';
import '../models/session.dart';
import '../widgets/stats_text.dart';

class TrackerScreen extends StatefulWidget {
  final GameTypes gameType;

  const TrackerScreen(this.gameType, {super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  late Session session;

  @override
  void initState() {
    session = Session();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session tracker'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Chrono(session.startTime),
          const StatsText(data: {'Hi': 24})
        ],
      ),
    );
  }
}
