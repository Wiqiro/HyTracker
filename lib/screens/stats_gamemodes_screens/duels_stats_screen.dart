import 'package:flutter/material.dart';

import '../../models/player.dart';
import '../../widgets/minecraft_text.dart';
import '../../widgets/profile_options.dart';
import '../../widgets/stats_table.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MinecraftText(
            player.formattedUsername,
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
                'UHC',
                'OP',
                'Skywars',
                'Mega Walls',
                'Bow',
                'Blitz',
                'Sumo',
                'Bow Spleef',
                'Classic',
                'No Debuff',
                'Combo',
                'Boxing',
                'Parkour',
                'Duel Arena',
                'Bridge',
              ],
              rows: {
                'Title': [
                  player.duelsStats.overall.formattedTitle,
                  player.duelsStats.uhc.formattedTitle,
                  player.duelsStats.op.formattedTitle,
                  player.duelsStats.skywars.formattedTitle,
                  player.duelsStats.megaWalls.formattedTitle,
                  player.duelsStats.bow.formattedTitle,
                  player.duelsStats.blitz.formattedTitle,
                  player.duelsStats.sumo.formattedTitle,
                  player.duelsStats.bowspleef.formattedTitle,
                  player.duelsStats.classic.formattedTitle,
                  player.duelsStats.noDebuff.formattedTitle,
                  player.duelsStats.combo.formattedTitle,
                  player.duelsStats.boxing.formattedTitle,
                  player.duelsStats.parkour.formattedTitle,
                  player.duelsStats.duelArena.formattedTitle,
                  player.duelsStats.bridge.formattedTitle,
                ],
                'Kills': [
                  player.duelsStats.overall.kills.toString(),
                  player.duelsStats.uhc.kills.toString(),
                  player.duelsStats.op.kills.toString(),
                  player.duelsStats.skywars.kills.toString(),
                  player.duelsStats.megaWalls.kills.toString(),
                  player.duelsStats.bow.kills.toString(),
                  player.duelsStats.blitz.kills.toString(),
                  player.duelsStats.sumo.kills.toString(),
                  player.duelsStats.bowspleef.kills.toString(),
                  player.duelsStats.classic.kills.toString(),
                  player.duelsStats.noDebuff.kills.toString(),
                  player.duelsStats.combo.kills.toString(),
                  player.duelsStats.boxing.kills.toString(),
                  player.duelsStats.parkour.kills.toString(),
                  player.duelsStats.duelArena.kills.toString(),
                  player.duelsStats.bridge.kills.toString(),
                ],
                'Deaths': [
                  player.duelsStats.overall.deaths.toString(),
                  player.duelsStats.uhc.deaths.toString(),
                  player.duelsStats.op.deaths.toString(),
                  player.duelsStats.skywars.deaths.toString(),
                  player.duelsStats.megaWalls.deaths.toString(),
                  player.duelsStats.bow.deaths.toString(),
                  player.duelsStats.blitz.deaths.toString(),
                  player.duelsStats.sumo.deaths.toString(),
                  player.duelsStats.bowspleef.deaths.toString(),
                  player.duelsStats.classic.deaths.toString(),
                  player.duelsStats.noDebuff.deaths.toString(),
                  player.duelsStats.combo.deaths.toString(),
                  player.duelsStats.boxing.deaths.toString(),
                  player.duelsStats.parkour.deaths.toString(),
                  player.duelsStats.duelArena.deaths.toString(),
                  player.duelsStats.bridge.deaths.toString(),
                ],
                'Wins': [
                  player.duelsStats.overall.wins.toString(),
                  player.duelsStats.uhc.wins.toString(),
                  player.duelsStats.op.wins.toString(),
                  player.duelsStats.skywars.wins.toString(),
                  player.duelsStats.megaWalls.wins.toString(),
                  player.duelsStats.bow.wins.toString(),
                  player.duelsStats.blitz.wins.toString(),
                  player.duelsStats.sumo.wins.toString(),
                  player.duelsStats.bowspleef.wins.toString(),
                  player.duelsStats.classic.wins.toString(),
                  player.duelsStats.noDebuff.wins.toString(),
                  player.duelsStats.combo.wins.toString(),
                  player.duelsStats.boxing.wins.toString(),
                  player.duelsStats.parkour.wins.toString(),
                  player.duelsStats.duelArena.wins.toString(),
                  player.duelsStats.bridge.wins.toString(),
                ],
                'Losses': [
                  player.duelsStats.overall.losses.toString(),
                  player.duelsStats.uhc.losses.toString(),
                  player.duelsStats.op.losses.toString(),
                  player.duelsStats.skywars.losses.toString(),
                  player.duelsStats.megaWalls.losses.toString(),
                  player.duelsStats.bow.losses.toString(),
                  player.duelsStats.blitz.losses.toString(),
                  player.duelsStats.sumo.losses.toString(),
                  player.duelsStats.bowspleef.losses.toString(),
                  player.duelsStats.classic.losses.toString(),
                  player.duelsStats.noDebuff.losses.toString(),
                  player.duelsStats.combo.losses.toString(),
                  player.duelsStats.boxing.losses.toString(),
                  player.duelsStats.parkour.losses.toString(),
                  player.duelsStats.duelArena.losses.toString(),
                  player.duelsStats.bridge.losses.toString(),
                ],
              },
            ),
          ),
        ],
      ),
    );
  }
}
