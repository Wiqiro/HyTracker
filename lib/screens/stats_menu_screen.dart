import 'package:flutter/material.dart';
import 'package:hytracker/models/player.dart';
import 'package:hytracker/models/stat_record_models/bedwars_stats.dart';
import 'package:hytracker/models/stat_record_models/skywars_stats.dart';
import 'package:hytracker/screens/stats_gamemodes_screens/bedwars_stats_screen.dart';
import 'package:hytracker/screens/stats_gamemodes_screens/skywars_stats_screen.dart';
import 'package:hytracker/widgets/formatted_username.dart';
import 'package:hytracker/widgets/search_bar.dart';

import '../utils/constants.dart';
import '../widgets/gamemode_card.dart';
import '../widgets/profile_options.dart';

class StatsMenuScreen extends StatelessWidget {
  static const String routeName = '/stats-screen';

  const StatsMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = ModalRoute.of(context)?.settings.arguments as Player;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player stats'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FormattedUsername(player: player, fontSize: 20),
            CustomSearchBar(
              hint: 'Enter player name',
              callback: (input) {},
            ),
            GamemodeCard(
              title: 'Bedwars',
              image: 'assets/images/bedwars.png',
              callback: () =>
                  Navigator.of(context).pushNamed(BedwarsStatsScreen.routeName, arguments: player),
              text: player.bedwarsStats.getSummarisedString,
            ),
            GamemodeCard(
              title: 'Skywars',
              image: 'assets/images/skywars.png',
              callback: () =>
                  Navigator.of(context).pushNamed(SkywarsStatsScreen.routeName, arguments: player),
              text: player.skywarsStats.getSummarisedString,
            ),
          ],
        ),
      ),
    );
  }
}
