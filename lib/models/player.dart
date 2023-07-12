import 'package:hytracker/models/stat_record_models/bedwars_stats.dart';
import 'package:hytracker/models/stat_record_models/skywars_stats.dart';
import 'package:hytracker/utils/ranks.dart';

class Player {
  final String username;

  late final Ranks rank;
  late final String? plusColor;
  late final String? mvpPlusPlusColor;

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
    _setRank(data);
    bedwarsStats = BedwarsStats.fromRawData(data['player']['stats']['Bedwars']);
    skywarsStats = SkywarsStats.fromRawData(data['player']['stats']['SkyWars']);
  }

  _setRank(Map<String, dynamic> data) {
    if (data['player'].containsKey('prefix')) {
      rank = switch (data['player']['prefix']) {
        '§d[PIG§b+++§d]' => Ranks.pigPlusPlusPlus,
        '§c[OWNER]' => Ranks.owner,
        '§6[MOJANG]' => Ranks.mojang,
        '§6[EVENTS]' => Ranks.events,
        _ => Ranks.none,
      };
    } else if (data['player'].containsKey('rank')) {
      rank = switch (data['player']['rank']) {
        'GAME_MASTER' => Ranks.gameMaster,
        'ADMIN' => Ranks.admin,
        'YOUTUBER' => Ranks.youtube,
        _ => Ranks.none,
      };
    } else if (data['player'].containsKey('newPackageRank')) {
      rank = switch (data['player']['newPackageRank']) {
        'VIP' => Ranks.vip,
        'VIP_PLUS' => Ranks.vipPlus,
        'MVP' => Ranks.mvp,
        'MVP_PLUS' => (data['player'].containsKey('monthlyPackageRank') &&
                data['player']['monthlyPackageRank'] == 'SUPERSTAR')
            ? Ranks.mvpPlusPlus
            : Ranks.mvpPlus,
        _ => Ranks.none,
      };
    } else {
      rank = Ranks.none;
    }

    if (rank == Ranks.mvpPlus || rank == Ranks.mvpPlusPlus) {
      plusColor =
          data['player'].containsKey('rankPlusColor') ? data['player']['rankPlusColor'] : 'RED';
    } else {
      plusColor = null;
    }

    if (rank == Ranks.mvpPlusPlus) {
      data['player'].containsKey('monthlyRankColor')
          ? mvpPlusPlusColor = data['player']['monthlyRankColor']
          : 'GOLD';
    } else {
      mvpPlusPlusColor = null;
    }
  }
}
