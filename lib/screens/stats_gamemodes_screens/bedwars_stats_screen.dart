import 'package:flutter/material.dart';
import 'package:hytracker/models/player.dart';
import 'package:hytracker/utils/color_converter.dart';
import 'package:hytracker/widgets/formatted_username.dart';

import '../../widgets/profile_options.dart';

class BedwarsStatsScreen extends StatelessWidget {
  static const routeName = '/stats-screens/bedwars';

  const BedwarsStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = ModalRoute.of(context)!.settings.arguments as Player;
    final stats = player.bedwarsStats;
    //print(stats.getFormattedPrefix);
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
            player: player,
            fontSize: 20,
            prefix: ColorConverter().mcFormattingToTextSpan('${stats.prefix} '),
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dividerThickness: 0.0,
                dataRowMinHeight: 20,
                dataRowMaxHeight: 30,
                headingRowHeight: 50,
                border: TableBorder.symmetric(inside: BorderSide.none),
                columns: const [
                  DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(label: Text('Overall')),
                  DataColumn(
                      label: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 18,
                      ),
                      Text('  Solo  '),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                      ),
                    ],
                  )),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('1')),
                      DataCell(Text('2')),
                      DataCell(Text('5')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('1')),
                      DataCell(Text('5')),
                      DataCell(Text('5')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
