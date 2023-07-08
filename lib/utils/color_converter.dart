import 'package:flutter/material.dart';

class ColorConverter {
  final Map<String, Color> mcCodeToFlutterColor = {
    '§4': const Color.fromRGBO(170, 0, 0, 1),
    '§c': const Color.fromRGBO(255, 85, 85, 1),
    '§6': const Color.fromRGBO(255, 170, 0, 1),
    '§e': const Color.fromRGBO(255, 255, 85, 1),
    '§2': const Color.fromRGBO(0, 170, 0, 1),
    '§a': const Color.fromRGBO(85, 255, 85, 1),
    '§b': const Color.fromRGBO(85, 255, 255, 1),
    '§3': const Color.fromRGBO(0, 170, 170, 1),
    '§1': const Color.fromRGBO(0, 0, 170, 1),
    '§9': const Color.fromRGBO(85, 85, 255, 1),
    '§d': const Color.fromRGBO(255, 85, 255, 1),
    '§5': const Color.fromRGBO(170, 0, 170, 1),
    '§f': const Color.fromRGBO(255, 255, 255, 1),
    '§7': const Color.fromRGBO(170, 170, 170, 1),
    '§8': const Color.fromRGBO(85, 85, 85, 1),
    '§0': const Color.fromRGBO(0, 0, 0, 1),
  };

  final Map<String, Color> fullNameToFlutterColor = {
    'DARK_RED': const Color.fromRGBO(170, 0, 0, 1),
    'RED': const Color.fromRGBO(255, 85, 85, 1),
    'GOLD': const Color.fromRGBO(255, 170, 0, 1),
    'YELLOW': const Color.fromRGBO(255, 255, 85, 1),
    'DARK_GREEN': const Color.fromRGBO(0, 170, 0, 1),
    'GREEN': const Color.fromRGBO(85, 255, 85, 1),
    'AQUA': const Color.fromRGBO(85, 255, 255, 1),
    'DARK_AQUA': const Color.fromRGBO(0, 170, 170, 1),
    'DARK_BLUE': const Color.fromRGBO(0, 0, 170, 1),
    'BLUE': const Color.fromRGBO(85, 85, 255, 1),
    'LIGHT_PURPLE': const Color.fromRGBO(255, 85, 255, 1),
    'DARK_PURPLE': const Color.fromRGBO(170, 0, 170, 1),
    'WHITE': const Color.fromRGBO(255, 255, 255, 1),
    'GRAY': const Color.fromRGBO(170, 170, 170, 1),
    'DARK_GRAY': const Color.fromRGBO(85, 85, 85, 1),
    'BLACK': Color.fromRGBO(0, 0, 0, 1),
  };

/*   Color? mcCodeToFlutterColor(String colorCode) {
    return _mcCodeToFlutterColor[colorCode];
  }

  Color? fullNameToFlutterColor(String colorCode) {
    return _fullNameToFlutterColor[colorCode];
  } */

  TextSpan mcFormattingToTextSpan(String string) {
    var exp = RegExp(r'§[0-9a-f](?:(?!§[0-9a-f]).)+');
    return TextSpan(
      children: exp.allMatches(string).map((e) {
        var match = e.group(0);
        return TextSpan(
          text: match?.replaceAll(RegExp(r'§.'), ''),
          style: TextStyle(
            color: mcCodeToFlutterColor[match?.substring(0, 2)],
          ),
        );
      }).toList(),
    );
  }
}
