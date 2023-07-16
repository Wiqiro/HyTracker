import 'package:flutter/material.dart';

import '../../models/player.dart';
import '../../widgets/profile_options.dart';

class DuelsStatsScreen extends StatelessWidget {
  final Player player;

  const DuelsStatsScreen(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duels stats'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
