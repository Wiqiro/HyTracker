import 'package:hytracker/models/stat_record_models/bedwars_stats.dart';
import 'package:hytracker/models/stat_record_models/skywars_stats.dart';
import 'package:hytracker/utils/color_converter.dart';

class Player {
  final String username;
  late final String formattedUsername;

  late final double networkLvl;
  late final int experience;
  late final double coinMultiplier;
  late final int karma;

  late final int quests;
  late final int challenges;
  late final int achievementPoints;

  late final BedwarsStats bedwarsStats;
  late final SkywarsStats skywarsStats;

  Player.fromRawData({required this.username, required Map<String, dynamic> data}) {
    formattedUsername = _formattedUsername(data);
    bedwarsStats = BedwarsStats.fromRawData(data['player']['stats']['Bedwars']);
    skywarsStats = SkywarsStats.fromRawData(data['player']['stats']['SkyWars']);
  }

  String _formattedUsername(Map<String, dynamic> data) {
    if (data['player'].containsKey('prefix')) {
      return switch (data['player']['prefix']) {
        '§d[PIG§b+++§d]' => '§d[PIG§b+++§d] $username',
        '§c[OWNER]' => '§c[OWNER] $username',
        '§6[MOJANG]' => '§6[MOJANG] $username',
        '§6[EVENTS]' => '§6[EVENTS] $username',
        _ => '§7$username',
      };
    } else if (data['player'].containsKey('rank')) {
      return switch (data['player']['rank']) {
        'GAME_MASTER' => '§2[GM] $username',
        'ADMIN' => '§c[ADMIN] $username',
        'YOUTUBER' => '§c[§fYOUTUBE§c] $username',
        _ => '§7$username',
      };
    } else if (data['player'].containsKey('newPackageRank')) {
      return switch (data['player']['newPackageRank']) {
        'VIP' => '§a[VIP] $username',
        'VIP_PLUS' => '§a[VIP§6+§a] $username',
        'MVP' => '§b[MVP] $username',
        'MVP_PLUS' => (data['player'].containsKey('monthlyPackageRank') && data['player']['monthlyPackageRank'] == 'SUPERSTAR')
            ? (data['player'].containsKey('monthlyRankColor') && data['player']['monthlyRankColor'] == 'AQUA'
                ? '§b[MVP${ColorConverter().colorNameToCode(data['player']['rankPlusColor'])}++§b] $username'
                : '§6[MVP${ColorConverter().colorNameToCode(data['player']['rankPlusColor'])}++§6] $username')
            : '§b[MVP${ColorConverter().colorNameToCode(data['player']['rankPlusColor'])}+§b] $username',
        _ => '§7$username',
      };
    } else {
      return '§7$username';
    }
  }
}
