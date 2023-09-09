import 'package:flutter/material.dart';
import 'package:hytracker/models/player.dart';
import 'package:hytracker/widgets/minecraft_text.dart';
import 'package:hytracker/widgets/stats_table.dart';

import '../../widgets/profile_options.dart';

class BedwarsStatsScreen extends StatelessWidget {
  final Player player;

  const BedwarsStatsScreen(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bedwars stats'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MinecraftText(
              '${player.bedwarsStats.prefix} ${player.formattedUsername}',
              fontSize: 20,
              fontFamily: 'Minecraftia',
            ),
            const SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: StatsTable(
                colNames: const [
                  'Overall',
                  'Solo',
                  'Doubles',
                  'Threes',
                  'Fours',
                ],
                rows: {
                  'Kills': [
                    player.bedwarsStats.overall.kills.toString(),
                    player.bedwarsStats.solo.kills.toString(),
                    player.bedwarsStats.doubles.kills.toString(),
                    player.bedwarsStats.threes.kills.toString(),
                    player.bedwarsStats.fours.kills.toString(),
                  ],
                  'Deaths': [
                    player.bedwarsStats.overall.deaths.toString(),
                    player.bedwarsStats.solo.deaths.toString(),
                    player.bedwarsStats.doubles.deaths.toString(),
                    player.bedwarsStats.threes.deaths.toString(),
                    player.bedwarsStats.fours.deaths.toString(),
                  ],
                  'K/D Ratio': [
                    (player.bedwarsStats.overall.kdRatio).toStringAsFixed(2),
                    (player.bedwarsStats.solo.kdRatio).toStringAsFixed(2),
                    (player.bedwarsStats.doubles.kdRatio).toStringAsFixed(2),
                    (player.bedwarsStats.threes.kdRatio).toStringAsFixed(2),
                    (player.bedwarsStats.fours.kdRatio).toStringAsFixed(2),
                  ],
                  '': List.filled(5, ''),
                  'Final kills': [
                    player.bedwarsStats.overall.finalKills.toString(),
                    player.bedwarsStats.solo.finalKills.toString(),
                    player.bedwarsStats.doubles.finalKills.toString(),
                    player.bedwarsStats.threes.finalKills.toString(),
                    player.bedwarsStats.fours.finalKills.toString(),
                  ],
                  'Final deaths': [
                    player.bedwarsStats.overall.finalDeaths.toString(),
                    player.bedwarsStats.solo.finalDeaths.toString(),
                    player.bedwarsStats.doubles.finalDeaths.toString(),
                    player.bedwarsStats.threes.finalDeaths.toString(),
                    player.bedwarsStats.fours.finalDeaths.toString(),
                  ],
                  'FK/D Ratio': [
                    (player.bedwarsStats.overall.fkdRatio).toStringAsFixed(2),
                    (player.bedwarsStats.solo.fkdRatio).toStringAsFixed(2),
                    (player.bedwarsStats.doubles.fkdRatio).toStringAsFixed(2),
                    (player.bedwarsStats.threes.fkdRatio).toStringAsFixed(2),
                    (player.bedwarsStats.fours.fkdRatio).toStringAsFixed(2),
                  ],
                  ' ': List.filled(5, ''),
                  'Wins': [
                    player.bedwarsStats.overall.wins.toString(),
                    player.bedwarsStats.solo.wins.toString(),
                    player.bedwarsStats.doubles.wins.toString(),
                    player.bedwarsStats.threes.wins.toString(),
                    player.bedwarsStats.fours.wins.toString(),
                  ],
                  'Losses': [
                    player.bedwarsStats.overall.losses.toString(),
                    player.bedwarsStats.solo.losses.toString(),
                    player.bedwarsStats.doubles.losses.toString(),
                    player.bedwarsStats.threes.losses.toString(),
                    player.bedwarsStats.fours.losses.toString(),
                  ],
                  'W/L Ratio': [
                    player.bedwarsStats.overall.wlRatio.toStringAsFixed(2),
                    player.bedwarsStats.solo.wlRatio.toStringAsFixed(2),
                    player.bedwarsStats.doubles.wlRatio.toStringAsFixed(2),
                    player.bedwarsStats.threes.wlRatio.toStringAsFixed(2),
                    player.bedwarsStats.fours.wlRatio.toStringAsFixed(2),
                  ],
                  'Winstreak': [
                    player.bedwarsStats.overall.winstreak.toString(),
                    player.bedwarsStats.solo.winstreak.toString(),
                    player.bedwarsStats.doubles.winstreak.toString(),
                    player.bedwarsStats.threes.winstreak.toString(),
                    player.bedwarsStats.fours.winstreak.toString(),
                  ],
                  '  ': List.filled(5, ''),
                  'Beds broken': [
                    player.bedwarsStats.overall.bedsBroken.toString(),
                    player.bedwarsStats.solo.bedsBroken.toString(),
                    player.bedwarsStats.doubles.bedsBroken.toString(),
                    player.bedwarsStats.threes.bedsBroken.toString(),
                    player.bedwarsStats.fours.bedsBroken.toString(),
                  ],
                  'Beds lost': [
                    player.bedwarsStats.overall.bedsLost.toString(),
                    player.bedwarsStats.solo.bedsLost.toString(),
                    player.bedwarsStats.doubles.bedsLost.toString(),
                    player.bedwarsStats.threes.bedsLost.toString(),
                    player.bedwarsStats.fours.bedsLost.toString(),
                  ],
                  'BB/L Ratio': [
                    player.bedwarsStats.overall.bblRatio.toStringAsFixed(2),
                    player.bedwarsStats.solo.bblRatio.toStringAsFixed(2),
                    player.bedwarsStats.doubles.bblRatio.toStringAsFixed(2),
                    player.bedwarsStats.threes.bblRatio.toStringAsFixed(2),
                    player.bedwarsStats.fours.bblRatio.toStringAsFixed(2),
                  ],
                },
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
