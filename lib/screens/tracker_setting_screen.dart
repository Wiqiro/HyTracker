import 'package:flutter/material.dart';
import 'package:hytracker/screens/tracker_screen.dart';
import 'package:hytracker/utils/game_types.dart';
import 'package:hytracker/widgets/main_button.dart';

import '../widgets/profile_options.dart';

class TrackerSettingScreen extends StatelessWidget {
  const TrackerSettingScreen({super.key});

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
      body: Center(
        child: MainButton(
          text: 'Start',
          callback: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const TrackerScreen(GameTypes.bedwars),
              ),
            );
          },
        ),
      ),
    );
  }
}
