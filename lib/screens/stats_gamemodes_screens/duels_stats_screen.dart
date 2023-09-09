import 'package:flutter/material.dart';

import '../../models/player.dart';
import '../../widgets/minecraft_text.dart';
import '../../widgets/profile_options.dart';
import '../../widgets/stats_table.dart';

class DuelsStatsScreen extends StatefulWidget {
  final Player player;

  const DuelsStatsScreen(this.player, {super.key});

  Widget _buildUhcTable() => StatsTable(
        colNames: const ['UHC', '1v1', '2v2', '4v4'],
        rows: {
          'Wins': [
            player.duelsStats.uhcOverall.wins.toString(),
            player.duelsStats.uhcSolo.wins.toString(),
            player.duelsStats.uhcDoubles.wins.toString(),
            player.duelsStats.uhcFours.wins.toString(),
          ],
          'Losses': [
            player.duelsStats.uhcOverall.losses.toString(),
            player.duelsStats.uhcSolo.losses.toString(),
            player.duelsStats.uhcDoubles.losses.toString(),
            player.duelsStats.uhcFours.losses.toString(),
          ],
          'W/L Ratio': [
            player.duelsStats.uhcOverall.wlRatio.toStringAsFixed(2),
            player.duelsStats.uhcSolo.wlRatio.toStringAsFixed(2),
            player.duelsStats.uhcDoubles.wlRatio.toStringAsFixed(2),
            player.duelsStats.uhcFours.wlRatio.toStringAsFixed(2),
          ],
          '': List.filled(4, ''),
          'Kills': [
            player.duelsStats.uhcOverall.kills.toString(),
            player.duelsStats.uhcSolo.kills.toString(),
            player.duelsStats.uhcDoubles.kills.toString(),
            player.duelsStats.uhcFours.kills.toString(),
          ],
          'Deaths': [
            player.duelsStats.uhcOverall.deaths.toString(),
            player.duelsStats.uhcSolo.deaths.toString(),
            player.duelsStats.uhcDoubles.deaths.toString(),
            player.duelsStats.uhcFours.deaths.toString(),
          ],
          'K/D Ratio': [
            player.duelsStats.uhcOverall.kdRatio.toStringAsFixed(2),
            player.duelsStats.uhcSolo.kdRatio.toStringAsFixed(2),
            player.duelsStats.uhcDoubles.kdRatio.toStringAsFixed(2),
            player.duelsStats.uhcFours.kdRatio.toStringAsFixed(2),
          ],
        },
      );

  Widget _buildOpTable() => StatsTable(
        colNames: const ['OP', '1v1', '2v2'],
        rows: {
          'Wins': [
            player.duelsStats.opOverall.wins.toString(),
            player.duelsStats.opSolo.wins.toString(),
            player.duelsStats.opDoubles.wins.toString(),
          ],
          'Losses': [
            player.duelsStats.opOverall.losses.toString(),
            player.duelsStats.opSolo.losses.toString(),
            player.duelsStats.opDoubles.losses.toString(),
          ],
          'W/L Ratio': [
            player.duelsStats.opOverall.wlRatio.toStringAsFixed(2),
            player.duelsStats.opSolo.wlRatio.toStringAsFixed(2),
            player.duelsStats.opDoubles.wlRatio.toStringAsFixed(2),
          ],
          '': List.filled(3, ''),
          'Kills': [
            player.duelsStats.opOverall.kills.toString(),
            player.duelsStats.opSolo.kills.toString(),
            player.duelsStats.opDoubles.kills.toString(),
          ],
          'Deaths': [
            player.duelsStats.opOverall.deaths.toString(),
            player.duelsStats.opSolo.deaths.toString(),
            player.duelsStats.opDoubles.deaths.toString(),
          ],
          'K/D Ratio': [
            player.duelsStats.opOverall.kdRatio.toStringAsFixed(2),
            player.duelsStats.opSolo.kdRatio.toStringAsFixed(2),
            player.duelsStats.opDoubles.kdRatio.toStringAsFixed(2),
          ],
        },
      );

  Widget _buildSkywarsTable() => StatsTable(
        colNames: const ['Skywars', '1v1', '2v2'],
        rows: {
          'Wins': [
            player.duelsStats.skywarsOverall.wins.toString(),
            player.duelsStats.skywarsSolo.wins.toString(),
            player.duelsStats.skywarsDoubles.wins.toString(),
          ],
          'Losses': [
            player.duelsStats.skywarsOverall.losses.toString(),
            player.duelsStats.skywarsSolo.losses.toString(),
            player.duelsStats.skywarsDoubles.losses.toString(),
          ],
          'W/L Ratio': [
            player.duelsStats.skywarsOverall.wlRatio.toStringAsFixed(2),
            player.duelsStats.skywarsSolo.wlRatio.toStringAsFixed(2),
            player.duelsStats.skywarsDoubles.wlRatio.toStringAsFixed(2),
          ],
          '': List.filled(3, ''),
          'Kills': [
            player.duelsStats.skywarsOverall.kills.toString(),
            player.duelsStats.skywarsSolo.kills.toString(),
            player.duelsStats.skywarsDoubles.kills.toString(),
          ],
          'Deaths': [
            player.duelsStats.skywarsOverall.deaths.toString(),
            player.duelsStats.skywarsSolo.deaths.toString(),
            player.duelsStats.skywarsDoubles.deaths.toString(),
          ],
          'K/D Ratio': [
            player.duelsStats.skywarsOverall.kdRatio.toStringAsFixed(2),
            player.duelsStats.skywarsSolo.kdRatio.toStringAsFixed(2),
            player.duelsStats.skywarsDoubles.kdRatio.toStringAsFixed(2),
          ],
        },
      );

  Widget _buildMwTable() => StatsTable(
        colNames: const ['Mega Walls', '1v1', '2v2'],
        rows: {
          'Wins': [
            player.duelsStats.megaWallsOverall.wins.toString(),
            player.duelsStats.megaWallsSolo.wins.toString(),
            player.duelsStats.megaWallsDoubles.wins.toString(),
          ],
          'Losses': [
            player.duelsStats.megaWallsOverall.losses.toString(),
            player.duelsStats.megaWallsSolo.losses.toString(),
            player.duelsStats.megaWallsDoubles.losses.toString(),
          ],
          'W/L Ratio': [
            player.duelsStats.megaWallsOverall.wlRatio.toStringAsFixed(2),
            player.duelsStats.megaWallsSolo.wlRatio.toStringAsFixed(2),
            player.duelsStats.megaWallsDoubles.wlRatio.toStringAsFixed(2),
          ],
          '': List.filled(3, ''),
          'Kills': [
            player.duelsStats.megaWallsOverall.kills.toString(),
            player.duelsStats.megaWallsSolo.kills.toString(),
            player.duelsStats.megaWallsDoubles.kills.toString(),
          ],
          'Deaths': [
            player.duelsStats.megaWallsOverall.deaths.toString(),
            player.duelsStats.megaWallsSolo.deaths.toString(),
            player.duelsStats.megaWallsDoubles.deaths.toString(),
          ],
          'K/D Ratio': [
            player.duelsStats.megaWallsOverall.kdRatio.toStringAsFixed(2),
            player.duelsStats.megaWallsSolo.kdRatio.toStringAsFixed(2),
            player.duelsStats.megaWallsDoubles.kdRatio.toStringAsFixed(2),
          ],
        },
      );

  Widget _buildBridgeTable() => StatsTable(
        colNames: const [
          'Bridge',
          '1v1',
          '2v2',
          '3v3',
          '4v4',
          '2v2v2v2',
          '3v3v3v3',
          'CTF',
        ],
        rows: {
          'Wins': [
            player.duelsStats.bridgeOverall.wins.toString(),
            player.duelsStats.bridge1v1.wins.toString(),
            player.duelsStats.bridge2v2.wins.toString(),
            player.duelsStats.bridge3v3.wins.toString(),
            player.duelsStats.bridge4v4.wins.toString(),
            player.duelsStats.bridge2v2v2v2.wins.toString(),
            player.duelsStats.bridge3v3v3v3.wins.toString(),
            player.duelsStats.bridgeCapture.wins.toString(),
          ],
          'Losses': [
            player.duelsStats.bridgeOverall.losses.toString(),
            player.duelsStats.bridge1v1.losses.toString(),
            player.duelsStats.bridge2v2.losses.toString(),
            player.duelsStats.bridge3v3.losses.toString(),
            player.duelsStats.bridge4v4.losses.toString(),
            player.duelsStats.bridge2v2v2v2.losses.toString(),
            player.duelsStats.bridge3v3v3v3.losses.toString(),
            player.duelsStats.bridgeCapture.losses.toString(),
          ],
          'W/L Ratio': [
            player.duelsStats.bridgeOverall.wlRatio.toStringAsFixed(2),
            player.duelsStats.bridge1v1.wlRatio.toStringAsFixed(2),
            player.duelsStats.bridge2v2.wlRatio.toStringAsFixed(2),
            player.duelsStats.bridge3v3.wlRatio.toStringAsFixed(2),
            player.duelsStats.bridge4v4.wlRatio.toStringAsFixed(2),
            player.duelsStats.bridge2v2v2v2.wlRatio.toStringAsFixed(2),
            player.duelsStats.bridge3v3v3v3.wlRatio.toStringAsFixed(2),
            player.duelsStats.bridgeCapture.wlRatio.toStringAsFixed(2),
          ],
          '': List.filled(8, ''),
          'Kills': [
            player.duelsStats.bridgeOverall.kills.toString(),
            player.duelsStats.bridge1v1.kills.toString(),
            player.duelsStats.bridge2v2.kills.toString(),
            player.duelsStats.bridge3v3.kills.toString(),
            player.duelsStats.bridge4v4.kills.toString(),
            player.duelsStats.bridge2v2v2v2.kills.toString(),
            player.duelsStats.bridge3v3v3v3.kills.toString(),
            player.duelsStats.bridgeCapture.kills.toString(),
          ],
          'Deaths': [
            player.duelsStats.bridgeOverall.deaths.toString(),
            player.duelsStats.bridge1v1.deaths.toString(),
            player.duelsStats.bridge2v2.deaths.toString(),
            player.duelsStats.bridge3v3.deaths.toString(),
            player.duelsStats.bridge4v4.deaths.toString(),
            player.duelsStats.bridge2v2v2v2.deaths.toString(),
            player.duelsStats.bridge3v3v3v3.deaths.toString(),
            player.duelsStats.bridgeCapture.deaths.toString(),
          ],
          'K/D Ratio': [
            player.duelsStats.bridgeOverall.kdRatio.toStringAsFixed(2),
            player.duelsStats.bridge1v1.kdRatio.toStringAsFixed(2),
            player.duelsStats.bridge2v2.kdRatio.toStringAsFixed(2),
            player.duelsStats.bridge3v3.kdRatio.toStringAsFixed(2),
            player.duelsStats.bridge4v4.kdRatio.toStringAsFixed(2),
            player.duelsStats.bridge2v2v2v2.kdRatio.toStringAsFixed(2),
            player.duelsStats.bridge3v3v3v3.kdRatio.toStringAsFixed(2),
            player.duelsStats.bridgeCapture.kdRatio.toStringAsFixed(2),
          ],
          ' ': List.filled(8, ''),
          'Scores': [
            player.duelsStats.bridgeOverall.scores.toString(),
            player.duelsStats.bridge1v1.scores.toString(),
            player.duelsStats.bridge2v2.scores.toString(),
            player.duelsStats.bridge3v3.scores.toString(),
            player.duelsStats.bridge4v4.scores.toString(),
            player.duelsStats.bridge2v2v2v2.scores.toString(),
            player.duelsStats.bridge3v3v3v3.scores.toString(),
            player.duelsStats.bridgeCapture.scores.toString(),
          ],
        },
      );

  @override
  State<DuelsStatsScreen> createState() => _DuelsStatsScreenState();
}

class _DuelsStatsScreenState extends State<DuelsStatsScreen> {
  String selectedMode = 'UHC';

  Widget buildMainTable() => StatsTable(
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
            widget.player.duelsStats.overall.formattedTitle,
            widget.player.duelsStats.uhcOverall.formattedTitle,
            widget.player.duelsStats.opOverall.formattedTitle,
            widget.player.duelsStats.skywarsOverall.formattedTitle,
            widget.player.duelsStats.megaWallsOverall.formattedTitle,
            widget.player.duelsStats.bow.formattedTitle,
            widget.player.duelsStats.blitz.formattedTitle,
            widget.player.duelsStats.sumo.formattedTitle,
            widget.player.duelsStats.bowspleef.formattedTitle,
            widget.player.duelsStats.classic.formattedTitle,
            widget.player.duelsStats.noDebuff.formattedTitle,
            widget.player.duelsStats.combo.formattedTitle,
            widget.player.duelsStats.boxing.formattedTitle,
            widget.player.duelsStats.parkour.formattedTitle,
            widget.player.duelsStats.duelArena.formattedTitle,
            widget.player.duelsStats.bridgeOverall.formattedTitle,
          ],
          '': List.filled(16, ''),
          'Wins': [
            widget.player.duelsStats.overall.wins.toString(),
            widget.player.duelsStats.uhcOverall.wins.toString(),
            widget.player.duelsStats.opOverall.wins.toString(),
            widget.player.duelsStats.skywarsOverall.wins.toString(),
            widget.player.duelsStats.megaWallsOverall.wins.toString(),
            widget.player.duelsStats.bow.wins.toString(),
            widget.player.duelsStats.blitz.wins.toString(),
            widget.player.duelsStats.sumo.wins.toString(),
            widget.player.duelsStats.bowspleef.wins.toString(),
            widget.player.duelsStats.classic.wins.toString(),
            widget.player.duelsStats.noDebuff.wins.toString(),
            widget.player.duelsStats.combo.wins.toString(),
            widget.player.duelsStats.boxing.wins.toString(),
            widget.player.duelsStats.parkour.wins.toString(),
            widget.player.duelsStats.duelArena.wins.toString(),
            widget.player.duelsStats.bridgeOverall.wins.toString(),
          ],
          'Losses': [
            widget.player.duelsStats.overall.losses.toString(),
            widget.player.duelsStats.uhcOverall.losses.toString(),
            widget.player.duelsStats.opOverall.losses.toString(),
            widget.player.duelsStats.skywarsOverall.losses.toString(),
            widget.player.duelsStats.megaWallsOverall.losses.toString(),
            widget.player.duelsStats.bow.losses.toString(),
            widget.player.duelsStats.blitz.losses.toString(),
            widget.player.duelsStats.sumo.losses.toString(),
            widget.player.duelsStats.bowspleef.losses.toString(),
            widget.player.duelsStats.classic.losses.toString(),
            widget.player.duelsStats.noDebuff.losses.toString(),
            widget.player.duelsStats.combo.losses.toString(),
            widget.player.duelsStats.boxing.losses.toString(),
            widget.player.duelsStats.parkour.losses.toString(),
            widget.player.duelsStats.duelArena.losses.toString(),
            widget.player.duelsStats.bridgeOverall.losses.toString(),
          ],
          'W/L Ratio': [
            widget.player.duelsStats.overall.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.uhcOverall.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.opOverall.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.skywarsOverall.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.megaWallsOverall.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.bow.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.blitz.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.sumo.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.bowspleef.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.classic.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.noDebuff.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.combo.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.boxing.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.parkour.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.duelArena.wlRatio.toStringAsFixed(2),
            widget.player.duelsStats.bridgeOverall.wlRatio.toStringAsFixed(2),
          ],
          ' ': List.filled(16, ''),
          'Kills': [
            widget.player.duelsStats.overall.kills.toString(),
            widget.player.duelsStats.uhcOverall.kills.toString(),
            widget.player.duelsStats.opOverall.kills.toString(),
            widget.player.duelsStats.skywarsOverall.kills.toString(),
            widget.player.duelsStats.megaWallsOverall.kills.toString(),
            widget.player.duelsStats.bow.kills.toString(),
            widget.player.duelsStats.blitz.kills.toString(),
            widget.player.duelsStats.sumo.kills.toString(),
            widget.player.duelsStats.bowspleef.kills.toString(),
            widget.player.duelsStats.classic.kills.toString(),
            widget.player.duelsStats.noDebuff.kills.toString(),
            widget.player.duelsStats.combo.kills.toString(),
            widget.player.duelsStats.boxing.kills.toString(),
            widget.player.duelsStats.parkour.kills.toString(),
            widget.player.duelsStats.duelArena.kills.toString(),
            widget.player.duelsStats.bridgeOverall.kills.toString(),
          ],
          'Deaths': [
            widget.player.duelsStats.overall.deaths.toString(),
            widget.player.duelsStats.uhcOverall.deaths.toString(),
            widget.player.duelsStats.opOverall.deaths.toString(),
            widget.player.duelsStats.skywarsOverall.deaths.toString(),
            widget.player.duelsStats.megaWallsOverall.deaths.toString(),
            widget.player.duelsStats.bow.deaths.toString(),
            widget.player.duelsStats.blitz.deaths.toString(),
            widget.player.duelsStats.sumo.deaths.toString(),
            widget.player.duelsStats.bowspleef.deaths.toString(),
            widget.player.duelsStats.classic.deaths.toString(),
            widget.player.duelsStats.noDebuff.deaths.toString(),
            widget.player.duelsStats.combo.deaths.toString(),
            widget.player.duelsStats.boxing.deaths.toString(),
            widget.player.duelsStats.parkour.deaths.toString(),
            widget.player.duelsStats.duelArena.deaths.toString(),
            widget.player.duelsStats.bridgeOverall.deaths.toString(),
          ],
          'K/D Ratio': [
            widget.player.duelsStats.overall.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.uhcOverall.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.opOverall.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.skywarsOverall.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.megaWallsOverall.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.bow.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.blitz.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.sumo.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.bowspleef.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.classic.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.noDebuff.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.combo.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.boxing.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.parkour.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.duelArena.kdRatio.toStringAsFixed(2),
            widget.player.duelsStats.bridgeOverall.kdRatio.toStringAsFixed(2),
          ],
        },
        onModeSelection: (mode) {
          setState(() {
            selectedMode = mode;
          });
        },
      );

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MinecraftText(
              widget.player.formattedUsername,
              fontSize: 20,
              fontFamily: 'Minecraftia',
            ),
            const SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: buildMainTable(),
            ),
            const SizedBox(
              width: double.infinity,
              height: 40,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: switch (selectedMode) {
                'UHC' => widget._buildUhcTable(),
                'OP' => widget._buildOpTable(),
                'Skywars' => widget._buildSkywarsTable(),
                'Bridge' => widget._buildBridgeTable(),
                'Mega Walls' => widget._buildMwTable(),
                _ => null,
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
