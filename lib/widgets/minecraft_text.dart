import 'package:flutter/material.dart';
import 'package:hytracker/utils/color_converter.dart' as color_converter;

class MinecraftText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;

  const MinecraftText(
    this.text, {
    this.fontSize,
    this.fontFamily,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return text.contains('§')
        ? RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                shadows: const [
                  Shadow(offset: Offset(0.5, 0.5), blurRadius: 2, color: Color(0x55000000)),
                ],
              ),
              children: RegExp(r'§[0-9a-f](?:(?!§[0-9a-f]).)+').allMatches(text).map((e) {
                var match = e.group(0);
                return TextSpan(
                  text: match?.replaceAll(RegExp(r'§.'), ''),
                  style: TextStyle(
                    color: color_converter.mcCodeToColor(match!.substring(0, 2)),
                  ),
                );
              }).toList(),
            ),
          )
        : Text(text);
  }
}
