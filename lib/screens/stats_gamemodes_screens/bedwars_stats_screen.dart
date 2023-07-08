import 'package:flutter/material.dart';
import 'package:hytracker/models/stat_record_models/bedwars_stat_record.dart';
import 'package:hytracker/utils/color_converter.dart';
import 'package:hytracker/widgets/formatted_username.dart';

import '../../widgets/profile_options.dart';

class BedwarsStatsScreen extends StatelessWidget {
  static const routeName = '/stats-screens/bedwars';

  const BedwarsStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = (ModalRoute.of(context)!.settings.arguments as BedwarsStatRecord).data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player stats'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormattedUsername(
            fontSize: 20,
            prefix: ColorConverter().mcFormattingToTextSpan('§l§8[§7116☬§l§8]§r '),
          ),
          Text(
            '''
Level: ${stats['overall']['level']}
Wins: ${stats['overall']['wins']}
Losses: ${stats['overall']['losses']}
Final kills: ${stats['overall']['fkills']}
Beds broken: ${stats['overall']['bedsBroken']}''',
          ),
        ],
      ),
    );
  }
}
