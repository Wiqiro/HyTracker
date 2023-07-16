import 'package:hytracker/models/stat_record.dart';

enum Prestiges {
  none,
  rookie,
  iron,
  gold,
  diamond,
  master,
  legend,
  grandmaster,
  godlike,
  celestial,
  divine,
  ascended,
}

class DuelsStats extends StatRecord {
  late final int coins;
  late final String prefix;
  late final DuelsModeStats overall;
  late final DuelsModeStats uhc;
  late final DuelsModeStats op;
  late final DuelsModeStats skywars;
  late final DuelsModeStats megaWalls;
  late final DuelsModeStats bow;
  late final DuelsModeStats blitz;
  late final DuelsModeStats sumo;
  late final DuelsModeStats bowspleef;
  late final DuelsModeStats classic;
  late final DuelsModeStats potion;
  late final DuelsModeStats combo;
  late final DuelsModeStats boxing;
  late final DuelsModeStats parkour;
  late final DuelsModeStats duelArena;
  late final DuelsModeStats bridge;

  DuelsStats({
    this.coins = 0,
    this.prefix = '',
    this.overall = const DuelsModeStats(),
    this.uhc = const DuelsModeStats(),
    this.op = const DuelsModeStats(),
    this.skywars = const DuelsModeStats(),
    this.megaWalls = const DuelsModeStats(),
    this.bow = const DuelsModeStats(),
    this.blitz = const DuelsModeStats(),
    this.sumo = const DuelsModeStats(),
    this.bowspleef = const DuelsModeStats(),
    this.classic = const DuelsModeStats(),
    this.potion = const DuelsModeStats(),
    this.combo = const DuelsModeStats(),
    this.boxing = const DuelsModeStats(),
    this.parkour = const DuelsModeStats(),
    this.duelArena = const DuelsModeStats(),
    this.bridge = const DuelsModeStats(),
  });

  DuelsStats.fromRawData(Map<String, dynamic> data);
}

class DuelsModeStats {
  final Prestiges prestigeTitle;
  final int titleLvl;

  final int kills;
  final int deaths;

  final int wins;
  final int losses;

  const DuelsModeStats({
    this.prestigeTitle = Prestiges.none,
    this.titleLvl = 0,
    this.kills = 0,
    this.deaths = 0,
    this.wins = 0,
    this.losses = 0,
  });

  String _toRoman(int nb) {
    return switch (nb) {
      1 => 'I',
      2 => 'II',
      3 => 'III',
      4 => 'IV',
      5 => 'V',
      6 => 'VI',
      7 => 'VII',
      8 => 'VIII',
      9 => 'IX',
      10 => 'X',
      11 => 'XI',
      12 => 'XII',
      13 => 'XIII',
      14 => 'XIV',
      15 => 'XV',
      16 => 'XVI',
      17 => 'XVII',
      18 => 'XVIII',
      19 => 'XIX',
      20 => 'XX',
      _ => 'I'
    };
  }

  String get formattedTitle {
    return switch (prestigeTitle) {
      Prestiges.none => '',
      Prestiges.rookie => '§8Rookie',
      Prestiges.iron => '§7Iron',
      Prestiges.gold => '§6Gold',
      Prestiges.diamond => '§3Diamond',
      Prestiges.master => '§2Master',
      Prestiges.legend => '§4Legend',
      Prestiges.grandmaster => '§eGrandmaster',
      Prestiges.godlike => '§5Godlike',
      Prestiges.celestial => '§bCelestial',
      Prestiges.divine => '§6Divine',
      Prestiges.ascended => '§cAscended',
    };
  }
}
