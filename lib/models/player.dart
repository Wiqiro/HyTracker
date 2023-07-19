import 'dart:math';

import 'package:hytracker/models/stat_record_models/bedwars_stats.dart';
import 'package:hytracker/models/stat_record_models/duels_stats.dart';
import 'package:hytracker/models/stat_record_models/skywars_stats.dart';
import 'package:hytracker/utils/color_converter.dart';

class Player {
  final String username;
  late final String formattedUsername;

  //late final double networkLvl;
  late final int experience;
  late final double coinMultiplier;
  late final int karma;

  late final int quests;
  late final int challenges;
  late final int achievementPoints;

  late final BedwarsStats bedwarsStats;
  late final SkywarsStats skywarsStats;
  late final DuelsStats duelsStats;

  Player.fromRawData({required this.username, required Map<String, dynamic> data}) {
    formattedUsername = _formattedUsername(data);

    experience = data['player'].containsKey('networkExp') ? data['player']['networkExp'].toInt() : 0;
    karma = data['player'].containsKey('karma') ? data['player']['karma'] : 0;

    bedwarsStats = BedwarsStats.fromRawData(data['player']['stats']['Bedwars']);
    skywarsStats = SkywarsStats.fromRawData(data['player']['stats']['SkyWars']);
    duelsStats = DuelsStats.fromRawData(data['player']['stats']['Duels']);
  }

  //Level formuma from https://hypixel.net/threads/guide-network-level-equations.3412241
  double get level => sqrt(experience / 1250 + 12.25) - 2.5;

  String _formattedUsername(Map<String, dynamic> data) {
    if (data['player'].containsKey('prefix')) {
      switch (data['player']['prefix']) {
        case '§d[PIG§b+++§d]':
          return '§d[PIG§b+++§d] $username';
        case '§c[OWNER]':
          return '§c[OWNER] $username';
        case '§6[MOJANG]':
          return '§6[MOJANG] $username';
        case '§6[EVENTS]':
          return '§6[EVENTS] $username';
      }
    }
    if (data['player'].containsKey('rank')) {
      switch (data['player']['rank']) {
        case 'GAME_MASTER':
          return '§2[GM] $username';
        case 'ADMIN':
          return '§c[ADMIN] $username';
        case 'YOUTUBER':
          return '§c[§fYOUTUBE§c] $username';
      }
    }
    if (data['player'].containsKey('newPackageRank')) {
      switch (data['player']['newPackageRank']) {
        case 'VIP':
          return '§a[VIP] $username';
        case 'VIP_PLUS':
          return '§a[VIP§6+§a] $username';
        case 'MVP':
          return '§b[MVP] $username';
        case 'MVP_PLUS':
          var plusColor = data['player'].containsKey('rankPlusColor')
              ? ColorConverter().colorNameToCode(data['player']['rankPlusColor'])
              : '§c';

          if (data['player'].containsKey('monthlyPackageRank') && data['player']['monthlyPackageRank'] == 'SUPERSTAR') {
            return data['player'].containsKey('monthlyRankColor') && data['player']['monthlyRankColor'] == 'AQUA'
                ? '§b[MVP$plusColor++§b] $username'
                : '§6[MVP$plusColor++§6] $username';
          } else {
            return '§b[MVP$plusColor+§b] $username';
          }
      }
    }
    return '§7$username';
  }
}
