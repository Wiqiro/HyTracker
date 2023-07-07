import 'package:flutter/material.dart';
import 'package:hytracker/models/stat_record_models/bedwars_stat_record.dart';

import '../../widgets/profile_options.dart';

class BedwarsStatsScreen extends StatelessWidget {
  static const routeName = '/stats-screens/bedwars';

  const BedwarsStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = ModalRoute.of(context)!.settings.arguments as BedwarsStatRecord;
    print(stats.data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player stats'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
