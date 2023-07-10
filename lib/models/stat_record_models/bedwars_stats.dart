import 'package:hytracker/models/stat_record.dart';

class BedwarsStats extends StatRecord {
  late final double level;
  late final int experience;
  late final String prestige;
  late final double coins;
  late final int lootChests;

  late final BedwarsModeStats overall;
  late final BedwarsModeStats solo;
  late final BedwarsModeStats doubles;
  late final BedwarsModeStats threes;
  late final BedwarsModeStats fours;

  BedwarsStats.fromRawData(Map<String, dynamic> data) {
    experience = data['Experience'].toInt();
    level = _level(experience);

    overall = BedwarsModeStats(
      kills: data['kills_bedwars'],
      deaths: 0,
      kdRatio: 0,
      finalKills: 0,
      finalDeaths: 0,
      fkdRatio: 0,
      wins: 0,
      losses: 0,
      wlRatio: 0,
      winstreak: 0,
      bedsBroken: 0,
      bedsLost: 0,
      bblRatio: 0,
    );
  }

  @override
  String get getSummarisedString {
    return '''
Level: $level
Wins: ${overall.wins}
Losses: ${overall.losses}
Final kills: ${overall.finalKills}
Beds broken: ${overall.bedsBroken}''';
  }

  double _level(int exp) {
    double expAbovePrestige = exp - ((exp / 487000).floor() * 487000);
    double prestigeLevel = (exp / 487000).floor() * 100;

    if (expAbovePrestige >= 7000) {
      return prestigeLevel + 4 + (expAbovePrestige - 7000) / 5000;
    } else if (expAbovePrestige >= 3500) {
      return prestigeLevel + 3 + (expAbovePrestige - 3500) / 3500;
    } else if (expAbovePrestige >= 1500) {
      return prestigeLevel + 2 + (expAbovePrestige - 1500) / 2000;
    } else if (expAbovePrestige >= 500) {
      return prestigeLevel + 1 + (expAbovePrestige - 500) / 500;
    } else {
      return prestigeLevel + expAbovePrestige / 500;
    }
  }

  String get getFormattedPrefix {
    String raw = '${level.floor()}';

    switch ((level / 100).floor()) {
      case 1:
        return '§f[$raw✫]';
      case 2:
        return '§6[$raw✫]';
      case 3:
        return '§b[$raw✫]';
      case 4:
        return '§2[$raw✫]';
      case 5:
        return '§3[$raw✫]';
      case 6:
        return '§4[$raw✫]';
      case 7:
        return '§d[$raw✫]';
      case 8:
        return '§9[$raw✫]';
      case 9:
        return '§5[$raw✫]';
      case 10:
        return '§c[§6${raw[0]}§e${raw[1]}§a${raw[2]}§b${raw[3]}§d✫§5]';
      case 11:
        return '§7[§f$raw§7✪§7]';
      case 12:
        return '§7[§e$raw§6✪§7]';
      case 13:
        return '§7[§b$raw§3✪§7]';
      case 14:
        return '§7[§a$raw§2✪§7]';
      case 15:
        return '§7[§3$raw§9✪§7]';
      case 16:
        return '§7[§c$raw§4✪§7]';
      case 17:
        return '§7[§d$raw§5✪§7]';
      case 18:
        return '§7[§9$raw§1✪§7]';
      case 19:
        return '§7[§5$raw§8✪§7]';
      case 20:
        return '§8[§7${raw[0]}§f${raw.substring(1, 3)}§7${raw[3]}✪§8]';
      case 21:
        return '§f[${raw[0]}§e${raw.substring(1, 3)}§6${raw[3]}⚝]';
      case 22:
        return '§6[${raw[0]}§f${raw.substring(1, 3)}§b${raw[3]}§3⚝]';
      case 23:
        return '§5[${raw[0]}§d${raw.substring(1, 3)}§6${raw[3]}§e⚝]';
      case 24:
        return '§b[${raw[0]}§f${raw.substring(1, 3)}§7${raw[3]}⚝§8]';
      case 25:
        return '§f[${raw[0]}§a${raw.substring(1, 3)}§2${raw[3]}⚝]';
      case 26:
        return '§4[${raw[0]}§c${raw.substring(1, 3)}§d${raw[3]}⚝§5]';
      case 27:
        return '§e[${raw[0]}§f${raw.substring(1, 3)}§8${raw[3]}⚝]';
      case 28:
        return '§a[${raw[0]}§2${raw.substring(1, 3)}§6${raw[3]}⚝§e]';
      case 29:
        return '§b[${raw[0]}§3${raw.substring(1, 3)}§9${raw[3]}⚝§1]';
      case 30:
        return '§e[${raw[0]}§6${raw.substring(1, 3)}§c${raw[3]}⚝§4]';
      default:
        return '§7[$raw✫]';
    }
  }
}

class BedwarsModeStats {
  final int kills;
  final int deaths;
  final int kdRatio;

  final int finalKills;
  final int finalDeaths;
  final int fkdRatio;

  final int wins;
  final int losses;
  final int wlRatio;
  final int winstreak;

  final int bedsBroken;
  final int bedsLost;
  final int bblRatio;

  BedwarsModeStats({
    required this.kills,
    required this.deaths,
    required this.kdRatio,
    required this.finalKills,
    required this.finalDeaths,
    required this.fkdRatio,
    required this.wins,
    required this.losses,
    required this.wlRatio,
    required this.winstreak,
    required this.bedsBroken,
    required this.bedsLost,
    required this.bblRatio,
  });
}
