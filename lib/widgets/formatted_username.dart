import 'package:flutter/material.dart';
import 'package:hytracker/utils/color_converter.dart';

class FormattedUsername extends StatelessWidget {
  final double fontSize;
  final String text;

  const FormattedUsername({
    required this.fontSize,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Minecraftia',
          fontSize: fontSize,
          shadows: const [
            Shadow(offset: Offset(0.5, 0.5), blurRadius: 2, color: Color(0x55000000)),
          ],
        ),
        children: [ColorConverter().mcFormattingToTextSpan(text)],
      ),
    );
  }
}
