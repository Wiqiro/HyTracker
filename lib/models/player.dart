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
      switch (data['player']['prefix']) {
        case '§d[PIG§b+++§d]':
          rank = Ranks.pigPlusPlusPlus;
          break;
        case '§c[OWNER]':
          rank = Ranks.owner;
          break;
        case '§6[MOJANG]':
          rank = Ranks.mojang;
          break;
        case '§6[EVENTS]':
          rank = Ranks.events;
          break;
        default:
          rank = Ranks.none;
          break;
      }
    } else if (data['player'].containsKey('rank')) {
      switch (data['player']['rank']) {
        case 'GAME_MASTER':
          rank = Ranks.gameMaster;
          break;
        case 'ADMIN':
          rank = Ranks.admin;
          break;
        case 'YOUTUBER':
          rank = Ranks.youtube;
          break;
        default:
          rank = Ranks.none;
          break;
      }
    } else if (data['player'].containsKey('newPackageRank')) {
      switch (data['player']['newPackageRank']) {
        case 'VIP':
          rank = Ranks.vip;
          break;
        case 'VIP_PLUS':
          rank = Ranks.vipPlus;
          break;
        case 'MVP':
          rank = Ranks.mvp;
          break;
        case 'MVP_PLUS':
          if (data['player'].containsKey('monthlyPackageRank') &&
              data['player']['monthlyPackageRank'] == 'SUPERSTAR') {
            rank = Ranks.mvpPlusPlus;
          } else {
            rank = Ranks.mvpPlus;
          }
          break;
        default:
          rank = Ranks.none;
          break;
      }
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
