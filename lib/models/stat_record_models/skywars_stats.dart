import 'package:hytracker/models/stat_record.dart';

class SkywarsStats extends StatRecord {
  late final double level;
  late final String prefix;
  late final int experience;
  late final String prestige;
  late final int coins;
  late final int lootChests;

  late final SkywarsModeStats overall;
  late final SkywarsModeStats soloNormal;
  late final SkywarsModeStats soloInsane;
  late final SkywarsModeStats teamsNormal;
  late final SkywarsModeStats teamsInsane;

  SkywarsStats.fromRawData(Map<String, dynamic> data) {
    level = _level(60);
    prefix = data['levelFormattedWithBrackets'];
    experience = data['skywars_experience'].toInt();

    overall = SkywarsModeStats(
      kills: 0,
      deaths: 0,
      kdRatio: 0,
      wins: 0,
      losses: 0,
      wlRatio: 0,
      winstreak: 0,
    );
  }

  @override
  String get getSummarisedString {
    return '''
Level: $level
Wins: ${overall.wins}
Losses: ${overall.losses}''';
  }

  double _level(int exp) {
    if (exp < 20) {
      return 1 + (exp / 20);
    } else if (exp < 70) {
      return 2 + (exp - 20) / 50;
    } else if (exp < 150) {
      return 3 + (exp - 70) / 80;
    } else if (exp < 250) {
      return 4 + (exp - 150) / 100;
    } else if (exp < 500) {
      return 5 + (exp - 250) / 250;
    } else if (exp < 1000) {
      return 6 + (exp - 500) / 500;
    } else if (exp < 2000) {
      return 7 + (exp - 1000) / 1000;
    } else if (exp < 3500) {
      return 8 + (exp - 2000) / 1500;
    } else if (exp < 6000) {
      return 9 + (exp - 3500) / 2500;
    } else if (exp < 10000) {
      return 10 + (exp - 6000) / 4000;
    } else if (exp < 15000) {
      return 11 + (exp - 10000) / 5000;
    } else {
      return 12 + (exp - 15000) / 10000;
    }
  }
}

class SkywarsModeStats {
  final int kills;
  final int deaths;
  final int kdRatio;

  final int wins;
  final int losses;
  final int wlRatio;
  final int winstreak;

  SkywarsModeStats({
    required this.kills,
    required this.deaths,
    required this.kdRatio,
    required this.wins,
    required this.losses,
    required this.wlRatio,
    required this.winstreak,
  });
}
