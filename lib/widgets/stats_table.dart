import 'package:flutter/material.dart';

import 'minecraft_text.dart';

class StatsTable extends StatefulWidget {
  final List<String> colNames;
  final Map<String, List<String>> rows;
  final void Function(String selectedMode) onModeSelection;

  static void defaultFunction(dynamic) {}

  const StatsTable({
    required this.colNames,
    required this.rows,
    this.onModeSelection = defaultFunction,
    super.key,
  });

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  var selectedModeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.topCenter,
      child: DataTable(
        dividerThickness: 0.05,
        dataRowMinHeight: 20,
        dataRowMaxHeight: 30,
        headingRowHeight: 50,
        columnSpacing: 30,
        dataTextStyle: const TextStyle(fontSize: 14, color: Colors.black),
        headingTextStyle: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
        border: TableBorder.symmetric(inside: BorderSide.none),
        columns: [
          const DataColumn(
            label: Text(''),
          ),
          DataColumn(label: Text(widget.colNames[0])),
          DataColumn(
            label: DropdownButton(
              items: widget.colNames.skip(1).map((String name) {
                return DropdownMenuItem<String>(
                  value: name,
                  child: Text(name),
                );
              }).toList(),
              onChanged: ((value) {
                if (value != null) {
                  widget.onModeSelection(value);
                  setState(() {
                    selectedModeIndex = widget.colNames.indexOf(value);
                  });
                }
              }),
              value: widget.colNames[selectedModeIndex],
              style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
              underline: Container(),
            ),
          ),
        ],
        rows: widget.rows.entries
            .map(
              (entry) => DataRow(cells: [
                DataCell(
                  Text(entry.key, style: const TextStyle(fontSize: 14)),
                ),
                DataCell(MinecraftText(
                  entry.value[0],
                )),
                DataCell(MinecraftText(
                  entry.value[selectedModeIndex],
                )),
              ]),
            )
            .toList(),
      ),
    );
  }
}
