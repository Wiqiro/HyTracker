import 'package:flutter/material.dart';

class StatsText extends StatelessWidget {
  final Map<String, num> data;
  final TextAlign textAlign;
  final double fontSize;

  const StatsText({
    required this.data,
    this.textAlign = TextAlign.left,
    this.fontSize = 14,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: Colors.black),
        children: data.entries
            .map(
              (entry) => TextSpan(
                text: '${entry.key}: ',
                children: [
                  TextSpan(
                    text: entry.value is int ? entry.value.toString() : entry.value.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
