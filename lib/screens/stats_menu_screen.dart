import 'package:flutter/material.dart';
import 'package:hytracker/models/stat_record_models/bedwars_stat_record.dart';
import 'package:hytracker/screens/stats_gamemodes_screens/bedwars_stats_screen.dart';
import 'package:hytracker/widgets/formatted_username.dart';
import 'package:hytracker/widgets/search_bar.dart';

import '../utils/constants.dart';
import '../widgets/gamemode_card.dart';
import '../widgets/profile_options.dart';

class StatsMenuScreen extends StatelessWidget {
  static const String routeName = '/stats-screen';

  //final Map<String, dynamic> data;

  const StatsMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const FormattedUsername(fontSize: 20),
            CustomSearchBar(
              hint: 'Enter player name',
              callback: (input) {},
            ),
            GamemodeCard(
              title: 'Bedwars',
              imagePath: 'assets/bedwars.png',
              onTapRoute: BedwarsStatsScreen.routeName,
              stats: BedwarsStatRecord.fromRawData(Constants.dummyData),
            )
          ],
        ),
      ),
    );
  }
}
