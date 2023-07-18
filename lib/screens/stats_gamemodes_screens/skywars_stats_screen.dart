import 'package:flutter/material.dart';
import 'package:hytracker/models/player.dart';

import '../../widgets/minecraft_text.dart';
import '../../widgets/profile_options.dart';
import '../../widgets/stats_table.dart';

class SkywarsStatsScreen extends StatelessWidget {
  final Player player;

  const SkywarsStatsScreen(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skywars stats'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
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
                  player.skywarsStats.overall.kills.toString(),
                  player.skywarsStats.soloNormal.kills.toString(),
                  player.skywarsStats.soloInsane.kills.toString(),
                  player.skywarsStats.teamsNormal.kills.toString(),
                  player.skywarsStats.teamsInsane.kills.toString(),
                ],
                'Deaths': [
                  player.skywarsStats.overall.deaths.toString(),
                  player.skywarsStats.soloNormal.deaths.toString(),
                  player.skywarsStats.soloInsane.deaths.toString(),
                  player.skywarsStats.teamsNormal.deaths.toString(),
                  player.skywarsStats.teamsInsane.deaths.toString(),
                ],
                'K/D Ratio': [
                  player.skywarsStats.overall.kdRatio.toStringAsFixed(2),
                  player.skywarsStats.soloNormal.kdRatio.toStringAsFixed(2),
                  player.skywarsStats.soloInsane.kdRatio.toStringAsFixed(2),
                  player.skywarsStats.teamsNormal.kdRatio.toStringAsFixed(2),
                  player.skywarsStats.teamsInsane.kdRatio.toStringAsFixed(2),
                ],
                'Wins': [
                  player.skywarsStats.overall.wins.toString(),
                  player.skywarsStats.soloNormal.wins.toString(),
                  player.skywarsStats.soloInsane.wins.toString(),
                  player.skywarsStats.teamsNormal.wins.toString(),
                  player.skywarsStats.teamsInsane.wins.toString(),
                ],
                'Losses': [
                  player.skywarsStats.overall.losses.toString(),
                  player.skywarsStats.soloNormal.losses.toString(),
                  player.skywarsStats.soloInsane.losses.toString(),
                  player.skywarsStats.teamsNormal.losses.toString(),
                  player.skywarsStats.teamsInsane.losses.toString(),
                ],
                'W/L Ratio': [
                  player.skywarsStats.overall.wlRatio.toStringAsFixed(2),
                  player.skywarsStats.soloNormal.wlRatio.toStringAsFixed(2),
                  player.skywarsStats.soloInsane.wlRatio.toStringAsFixed(2),
                  player.skywarsStats.teamsNormal.wlRatio.toStringAsFixed(2),
                  player.skywarsStats.teamsInsane.wlRatio.toStringAsFixed(2),
                ],
              },
            ),
          ),
        ],
      ),
    );
  }
}
