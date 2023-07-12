import 'package:flutter/material.dart';
import 'package:hytracker/utils/color_converter.dart';
import 'package:hytracker/utils/ranks.dart';

import '../models/player.dart';

class FormattedUsername extends StatelessWidget {
  final double fontSize;
  final InlineSpan prefix;
  final Player player;

  const FormattedUsername({
    required this.fontSize,
    required this.player,
    this.prefix = const TextSpan(),
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
        children: [prefix, _globalUsername(context)],
      ),
    );
  }

  TextSpan _globalUsername(BuildContext context) {
    //TODO: replace by creating formatted string
    switch (player.rank) {
      case Ranks.vip:
        return TextSpan(
          text: '[VIP] ${player.username}',
          style: TextStyle(color: ColorConverter().mcNameToColor('GREEN')),
        );
      case Ranks.vipPlus:
        return TextSpan(
          text: '[VIP',
          style: TextStyle(color: ColorConverter().mcNameToColor('GREEN')),
          children: [
            TextSpan(
              text: '+',
              style: TextStyle(color: ColorConverter().mcNameToColor('GOLD')),
            ),
            TextSpan(
              text: '] ${player.username}',
            ),
          ],
        );
      case Ranks.mvp:
        return TextSpan(
          text: '[MVP] ${player.username}',
          style: TextStyle(
            color: ColorConverter().mcNameToColor('AQUA'),
          ),
        );
      case Ranks.mvpPlus:
        return TextSpan(
          text: '[MVP',
          style: TextStyle(color: ColorConverter().mcNameToColor('AQUA')),
          children: [
            TextSpan(
              text: '+',
              style: TextStyle(color: ColorConverter().mcNameToColor(player.plusColor!)),
            ),
            TextSpan(
              text: '] ${player.username}',
            ),
          ],
        );
      case Ranks.mvpPlusPlus:
        return TextSpan(
          text: '[MVP',
          style: TextStyle(color: ColorConverter().mcNameToColor(player.mvpPlusPlusColor!)),
          children: [
            TextSpan(
              text: '++',
              style: TextStyle(color: ColorConverter().mcNameToColor(player.plusColor!)),
            ),
            TextSpan(
              text: '] ${player.username}',
            ),
          ],
        );
      case Ranks.gameMaster:
        return TextSpan(
          text: '[GM] ${player.username}',
          style: TextStyle(color: ColorConverter().mcNameToColor('DARK_GREEN')),
        );
      case Ranks.admin:
        return TextSpan(
          text: '[ADMIN] ${player.username}',
          style: TextStyle(color: ColorConverter().mcNameToColor('RED')),
        );
      case Ranks.owner:
        return TextSpan(
          text: '[OWNER] ${player.username}',
          style: TextStyle(color: ColorConverter().mcNameToColor('RED')),
        );
      case Ranks.youtube:
        return TextSpan(
          text: '[',
          style: TextStyle(color: ColorConverter().mcNameToColor('RED')),
          children: [
            TextSpan(
              text: 'YOUTUBE',
              style: TextStyle(color: ColorConverter().mcNameToColor('WHITE')),
            ),
            TextSpan(
              text: '] ${player.username}',
            ),
          ],
        );
      case Ranks.pigPlusPlusPlus:
        return TextSpan(
          text: '[PIG',
          style: TextStyle(color: ColorConverter().mcNameToColor('LIGHT_PURPLE')),
          children: [
            TextSpan(
              text: '+++',
              style: TextStyle(color: ColorConverter().mcNameToColor('AQUA')),
            ),
            TextSpan(
              text: '] ${player.username}',
            ),
          ],
        );
      case Ranks.mojang:
        return TextSpan(
          text: '[MOJANG] ${player.username}',
          style: TextStyle(color: ColorConverter().mcNameToColor('GOLD')),
        );
      case Ranks.events:
        return TextSpan(
          text: '[EVENTS] ${player.username}',
          style: TextStyle(color: ColorConverter().mcNameToColor('GOLD')),
        );
      default:
        return TextSpan(
          text: player.username,
          style: TextStyle(color: ColorConverter().mcNameToColor('GRAY')),
        );
    }
  }
}
