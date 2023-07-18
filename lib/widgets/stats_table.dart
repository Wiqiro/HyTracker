import 'package:flutter/material.dart';

import 'minecraft_text.dart';

class StatsTable extends StatefulWidget {
  final List<String> colNames;
  final Map<String, List<String>> rows;

  const StatsTable({
    required this.colNames,
    required this.rows,
    super.key,
  });

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  var selectedModeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DataTable(
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
                      selectedModeIndex = selectedModeIndex == 1 ? widget.colNames.length - 1 : selectedModeIndex - 1;
                    });
                  },
                ),
              ),
              Text('  ${widget.colNames[selectedModeIndex]}  '),
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
                      selectedModeIndex = selectedModeIndex == widget.colNames.length - 1 ? 1 : selectedModeIndex + 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
      rows: //[
          widget.rows.entries
              .map(
                (entry) => DataRow(cells: [
                  DataCell(Text(entry.key)),
                  DataCell(MinecraftText(entry.value[0])),
                  DataCell(MinecraftText(entry.value[selectedModeIndex])),
                ]),
              )
              .toList(),
    );
  }
}
