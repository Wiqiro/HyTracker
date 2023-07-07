import 'package:flutter/material.dart';
import 'package:hytracker/utils/color_converter.dart';
import 'package:hytracker/utils/ranks.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class FormattedUsername extends StatelessWidget {
  final double fontSize;

  const FormattedUsername({required this.fontSize, super.key});

  Widget _buildCustomRichText(TextSpan child) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          shadows: const [
            Shadow(offset: Offset(0.5, 0.5), blurRadius: 2, color: Color(0x55000000)),
          ],
        ),
        children: [child],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String username = Provider.of<UserProvider>(context).username!;
    final Ranks rank = Provider.of<UserProvider>(context).rank!;
    final String? plusColor = Provider.of<UserProvider>(context).plusColor;
    final String? mvpPlusPlusColor = Provider.of<UserProvider>(context).mvpPlusPlusColor;
    switch (rank) {
      case Ranks.vip:
        return _buildCustomRichText(
          TextSpan(
            text: '[VIP] $username',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['GREEN']),
          ),
        );
      case Ranks.vipPlus:
        return _buildCustomRichText(
          TextSpan(
            text: '[VIP',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['GREEN']),
            children: [
              TextSpan(
                text: '+',
                style: TextStyle(color: ColorConverter().fullNameToFlutterColor['GOLD']),
              ),
              TextSpan(
                text: '] $username',
              ),
            ],
          ),
        );
      case Ranks.mvp:
        return _buildCustomRichText(
          TextSpan(
            text: '[MVP] $username',
            style: TextStyle(
              color: ColorConverter().fullNameToFlutterColor['AQUA'],
            ),
          ),
        );
      case Ranks.mvpPlus:
        return _buildCustomRichText(
          TextSpan(
            text: '[MVP',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['AQUA']),
            children: [
              TextSpan(
                text: '+',
                style: TextStyle(color: ColorConverter().fullNameToFlutterColor[plusColor]),
              ),
              TextSpan(
                text: '] $username',
              ),
            ],
          ),
        );
      case Ranks.mvpPlusPlus:
        return _buildCustomRichText(
          TextSpan(
            text: '[MVP',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor[mvpPlusPlusColor]),
            children: [
              TextSpan(
                text: '++',
                style: TextStyle(color: ColorConverter().fullNameToFlutterColor[plusColor]),
              ),
              TextSpan(
                text: '] $username',
              ),
            ],
          ),
        );
      case Ranks.gameMaster:
        return _buildCustomRichText(
          TextSpan(
            text: '[GM] $username',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['DARK_GREEN']),
          ),
        );
      case Ranks.admin:
        return _buildCustomRichText(
          TextSpan(
            text: '[ADMIN] $username',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['RED']),
          ),
        );
      case Ranks.owner:
        return _buildCustomRichText(
          TextSpan(
            text: '[OWNER] $username',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['RED']),
          ),
        );
      case Ranks.youtube:
        return _buildCustomRichText(
          TextSpan(
            text: '[',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['RED']),
            children: [
              TextSpan(
                text: 'YOUTUBE',
                style: TextStyle(color: ColorConverter().fullNameToFlutterColor['WHITE']),
              ),
              TextSpan(
                text: '] $username',
              ),
            ],
          ),
        );
      case Ranks.pigPlusPlusPlus:
        return _buildCustomRichText(
          TextSpan(
            text: '[PIG',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['LIGHT_PURPLE']),
            children: [
              TextSpan(
                text: '+++',
                style: TextStyle(color: ColorConverter().fullNameToFlutterColor['AQUA']),
              ),
              TextSpan(
                text: '] $username',
              ),
            ],
          ),
        );
      case Ranks.mojang:
        return _buildCustomRichText(
          TextSpan(
            text: '[MOJANG] $username',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['GOLD']),
          ),
        );
      case Ranks.events:
        return _buildCustomRichText(
          TextSpan(
            text: '[EVENTS] $username',
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['GOLD']),
          ),
        );
      default:
        return _buildCustomRichText(
          TextSpan(
            text: username,
            style: TextStyle(color: ColorConverter().fullNameToFlutterColor['GRAY']),
          ),
        );
    }
  }
}
