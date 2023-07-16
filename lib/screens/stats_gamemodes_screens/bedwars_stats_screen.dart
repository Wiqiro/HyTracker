import 'package:flutter/material.dart';
import 'package:hytracker/models/player.dart';
import 'package:hytracker/models/stat_record_models/bedwars_stats.dart';
import 'package:hytracker/widgets/formatted_username.dart';

import '../../widgets/profile_options.dart';

class BedwarsStatsScreen extends StatefulWidget {
  final Player player;

  const BedwarsStatsScreen(this.player, {super.key});

  @override
  State<BedwarsStatsScreen> createState() => _BedwarsStatsScreenState();
}

class _BedwarsStatsScreenState extends State<BedwarsStatsScreen> {
  var selectedModeIndex = 0;
  late String selectedModeName;
  late BedwarsModeStats selectedMode;

  void _setMode() {
    setState(() {
      switch (selectedModeIndex) {
        case 0:
          selectedMode = widget.player.bedwarsStats.solo;
          selectedModeName = 'Solo';
        case 1:
          selectedMode = widget.player.bedwarsStats.doubles;
          selectedModeName = 'Doubles';
        case 2:
          selectedMode = widget.player.bedwarsStats.threes;
          selectedModeName = '3v3v3v3';
        case 3:
          selectedMode = widget.player.bedwarsStats.fours;
          selectedModeName = '4v4v4v4';
        default:
          selectedMode = widget.player.bedwarsStats.solo;
          selectedModeName = 'Solo';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _setMode();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bedwars stats'),
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
            text: '${widget.player.bedwarsStats.prefix} ${widget.player.formattedUsername}',
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: DataTable(
              dividerThickness: 0.1,
              dataRowMinHeight: 20,
              dataRowMaxHeight: 30,
              headingRowHeight: 50,
              columnSpacing: 30,
              border: TableBorder.symmetric(inside: BorderSide.none),
              columns: [
                const DataColumn(
                  label: Text(''),
                ),
                const DataColumn(label: Text('Overall')),
                DataColumn(
                  label: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 15,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedModeIndex = (selectedModeIndex - 1) % 4;
                            });
                          },
                        ),
                      ),
                      Text('  $selectedModeName  '),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedModeIndex = (selectedModeIndex + 1) % 4;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    const DataCell(Text('Kills')),
                    DataCell(Text(widget.player.bedwarsStats.overall.kills.toString())),
                    DataCell(Text(selectedMode.kills.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Deaths')),
                    DataCell(Text(widget.player.bedwarsStats.overall.deaths.toString())),
                    DataCell(Text(selectedMode.deaths.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('K/D Ratio')),
                    DataCell(Text(widget.player.bedwarsStats.overall.kdRatio.toStringAsFixed(2))),
                    DataCell(Text(selectedMode.kdRatio.toStringAsFixed(2))),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Final kills')),
                    DataCell(Text(widget.player.bedwarsStats.overall.finalKills.toString())),
                    DataCell(Text(selectedMode.finalKills.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Final deaths')),
                    DataCell(Text(widget.player.bedwarsStats.overall.finalDeaths.toString())),
                    DataCell(Text(selectedMode.finalDeaths.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('FK/D Ratio')),
                    DataCell(Text(widget.player.bedwarsStats.overall.fkdRatio.toStringAsFixed(2))),
                    DataCell(Text(selectedMode.fkdRatio.toStringAsFixed(2))),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Wins')),
                    DataCell(Text(widget.player.bedwarsStats.overall.wins.toString())),
                    DataCell(Text(selectedMode.wins.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Losses')),
                    DataCell(Text(widget.player.bedwarsStats.overall.losses.toString())),
                    DataCell(Text(selectedMode.losses.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('W/L Ratio')),
                    DataCell(Text(widget.player.bedwarsStats.overall.wlRatio.toStringAsFixed(2))),
                    DataCell(Text(selectedMode.kills.toStringAsFixed(2))),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Winstreak')),
                    DataCell(Text(widget.player.bedwarsStats.overall.winstreak.toString())),
                    DataCell(Text(selectedMode.winstreak.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Beds broken')),
                    DataCell(Text(widget.player.bedwarsStats.overall.bedsBroken.toString())),
                    DataCell(Text(selectedMode.bedsBroken.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Beds lost')),
                    DataCell(Text(widget.player.bedwarsStats.overall.bedsLost.toString())),
                    DataCell(Text(selectedMode.bedsLost.toString())),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('BB/L Ratio')),
                    DataCell(Text(widget.player.bedwarsStats.overall.bblRatio.toStringAsFixed(2))),
                    DataCell(Text(selectedMode.bblRatio.toStringAsFixed(2))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
