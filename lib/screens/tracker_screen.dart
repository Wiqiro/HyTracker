import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hytracker/providers/sessions.dart';
import 'package:hytracker/screens/tracker_setting_screen.dart';
import 'package:hytracker/widgets/main_button.dart';
import 'package:provider/provider.dart';
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
  late Timer refresher;
  int refreshRate = 5;

  @override
  void initState() {
    session = Session();
    refresher = Timer.periodic(Duration(seconds: refreshRate), (_) {
      session.refresh(context).then((_) => {setState(() {})});
    });
    super.initState();
  }

  @override
  void dispose() {
    refresher.cancel();
    session.end();
    super.dispose();
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
          ...session.records.isEmpty
              ? []
              : [
                  StatsText(data: {'Duel Wins': session.records.last.duelsStats.overall.wins}),
                  StatsText(data: {'Duel Deaths': session.records.last.duelsStats.overall.losses}),
                ],
          MainButton(
            text: 'End',
            callback: () {
              refresher.cancel();
              session.end();
              Provider.of<SessionsProvider>(context, listen: false).addSession(session);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const TrackerSettingScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
