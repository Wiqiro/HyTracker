import 'package:flutter/material.dart';

class ColorConverter {
  Color mcCodeToColor(String code) {
    return switch (code) {
      '§4' => const Color(0xffaa0000),
      '§c' => const Color(0xffff5555),
      '§6' => const Color(0xffffaa00),
      '§e' => const Color(0xffffff55),
      '§2' => const Color(0xff00aa00),
      '§a' => const Color(0xff55ff55),
      '§b' => const Color(0xff55ffff),
      '§3' => const Color(0xff00aaaa),
      '§1' => const Color(0xff0000aa),
      '§9' => const Color(0xff5555ff),
      '§d' => const Color(0xffff55ff),
      '§5' => const Color(0xffaa00aa),
      '§f' => const Color(0xffffffff),
      '§7' => const Color(0xffaaaaaa),
      '§8' => const Color(0xff555555),
      '§0' => const Color(0xff000000),
      _ => const Color(0xff000000)
    };
  }

  String colorNameToCode(String name) {
    return switch (name.toLowerCase()) {
      'dark_red' => '§4',
      'red' => '§c',
      'gold' => '§6',
      'yellow' => '§e',
      'dark_green' => '§2',
      'green' => '§a',
      'aqua' => '§b',
      'dark_aqua' => '§3',
      'dark_blue' => '§1',
      'blue' => '§1',
      'light_purple' => '§d',
      'dark_purple' => '§5',
      'white' => '§f',
      'gray' => '§7',
      'dark_gray' => '§8',
      'black' => '§0',
      _ => '§0',
    };
  }

  Color mcNameToColor(String name) {
    return switch (name.toLowerCase()) {
      'dark_red' => const Color(0xffaa0000),
      'red' => const Color(0xffff5555),
      'gold' => const Color(0xffffaa00),
      'yellow' => const Color(0xffffff55),
      'dark_green' => const Color(0xff00aa00),
      'green' => const Color(0xff55ff55),
      'aqua' => const Color(0xff55ffff),
      'dark_aqua' => const Color(0xff00aaaa),
      'dark_blue' => const Color(0xff0000aa),
      'blue' => const Color(0xff5555ff),
      'light_purple' => const Color(0xffff55ff),
      'dark_purple' => const Color(0xffaa00aa),
      'white' => const Color(0xffffffff),
      'gray' => const Color(0xffaaaaaa),
      'dark_gray' => const Color(0xff555555),
      'black' => const Color(0xff000000),
      _ => const Color(0xff000000)
    };
  }

  TextSpan mcFormattingToTextSpan(String string) {
    var exp = RegExp(r'§[0-9a-f](?:(?!§[0-9a-f]).)+');
    return TextSpan(
      children: exp.allMatches(string).map((e) {
        var match = e.group(0);
        return TextSpan(
          text: match?.replaceAll(RegExp(r'§.'), ''),
          //TODO: maybe nest to handle other styles
          style: TextStyle(
            color: mcCodeToColor(match!.substring(0, 2)),
          ),
        );
      }).toList(),
    );
  }
}
