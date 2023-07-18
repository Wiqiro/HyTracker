import 'package:hytracker/models/stat_record.dart';

/* enum Prestiges {
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
} */

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
  late final DuelsModeStats noDebuff;
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
    this.noDebuff = const DuelsModeStats(),
    this.combo = const DuelsModeStats(),
    this.boxing = const DuelsModeStats(),
    this.parkour = const DuelsModeStats(),
    this.duelArena = const DuelsModeStats(),
    this.bridge = const DuelsModeStats(),
  });

  DuelsStats.fromRawData(Map<String, dynamic> data) {
    coins = data.containsKey('coins') ? data['coins'] : 0;
    prefix = ''; //TODO

    overall = DuelsModeStats(
      kills: data.containsKey('kills') ? data['kills'] : 0,
      deaths: data.containsKey('deaths') ? data['deaths'] : 0,
      wins: data.containsKey('wins') ? data['wins'] : 0,
      losses: data.containsKey('losses') ? data['losses'] : 0,
      isOverall: true,
    );
    uhc = DuelsModeStats(
      kills: data.containsKey('uhc_duel_kills') ? data['uhc_duel_kills'] : 0,
      deaths: data.containsKey('uhc_duel_deaths') ? data['uhc_duel_deaths'] : 0,
      wins: data.containsKey('uhc_duel_wins') ? data['uhc_duel_wins'] : 0,
      losses: data.containsKey('uhc_duel_losses') ? data['uhc_duel_losses'] : 0,
      isOverall: false,
    );
    op = DuelsModeStats(
      kills: data.containsKey('op_duel_kills') ? data['op_duel_kills'] : 0,
      deaths: data.containsKey('op_duel_deaths') ? data['op_duel_deaths'] : 0,
      wins: data.containsKey('op_duel_wins') ? data['op_duel_wins'] : 0,
      losses: data.containsKey('op_duel_losses') ? data['op_duel_losses'] : 0,
      isOverall: false,
    );

    skywars = DuelsModeStats(
      kills: data.containsKey('sw_duel_kills') ? data['sw_duel_kills'] : 0,
      deaths: data.containsKey('sw_duel_deaths') ? data['sw_duel_deaths'] : 0,
      wins: data.containsKey('sw_duel_wins') ? data['sw_duel_wins'] : 0,
      losses: data.containsKey('sw_duel_losses') ? data['sw_duel_losses'] : 0,
      isOverall: false,
    );

    megaWalls = DuelsModeStats(
      kills: data.containsKey('mw_duel_kills') ? data['mw_duel_kills'] : 0,
      deaths: data.containsKey('mw_duel_deaths') ? data['mw_duel_deaths'] : 0,
      wins: data.containsKey('mw_duel_wins') ? data['mw_duel_wins'] : 0,
      losses: data.containsKey('mw_duel_losses') ? data['mw_duel_losses'] : 0,
      isOverall: false,
    );

    bow = DuelsModeStats(
      kills: data.containsKey('bow_duel_kills') ? data['bow_duel_kills'] : 0,
      deaths: data.containsKey('bow_duel_deaths') ? data['bow_duel_deaths'] : 0,
      wins: data.containsKey('bow_duel_wins') ? data['bow_duel_wins'] : 0,
      losses: data.containsKey('bow_duel_losses') ? data['bow_duel_losses'] : 0,
      isOverall: false,
    );

    blitz = DuelsModeStats(
      kills: data.containsKey('blitz_duel_kills') ? data['blitz_duel_kills'] : 0,
      deaths: data.containsKey('blitz_duel_deaths') ? data['blitz_duel_deaths'] : 0,
      wins: data.containsKey('blitz_duel_wins') ? data['blitz_duel_wins'] : 0,
      losses: data.containsKey('blitz_duel_losses') ? data['blitz_duel_losses'] : 0,
      isOverall: false,
    );

    sumo = DuelsModeStats(
      kills: data.containsKey('sumo_duel_kills') ? data['sumo_duel_kills'] : 0,
      deaths: data.containsKey('sumo_duel_deaths') ? data['sumo_duel_deaths'] : 0,
      wins: data.containsKey('sumo_duel_wins') ? data['sumo_duel_wins'] : 0,
      losses: data.containsKey('sumo_duel_losses') ? data['sumo_duel_losses'] : 0,
      isOverall: false,
    );

    bowspleef = DuelsModeStats(
      kills: data.containsKey('bowspleef_duel_kills') ? data['bowspleef_duel_kills'] : 0,
      deaths: data.containsKey('bowspleef_duel_deaths') ? data['bowspleef_duel_deaths'] : 0,
      wins: data.containsKey('bowspleef_duel_wins') ? data['bowspleef_duel_wins'] : 0,
      losses: data.containsKey('bowspleef_duel_losses') ? data['bowspleef_duel_losses'] : 0,
      isOverall: false,
    );

    classic = DuelsModeStats(
      kills: data.containsKey('classic_duel_kills') ? data['classic_duel_kills'] : 0,
      deaths: data.containsKey('classic_duel_deaths') ? data['classic_duel_deaths'] : 0,
      wins: data.containsKey('classic_duel_wins') ? data['classic_duel_wins'] : 0,
      losses: data.containsKey('classic_duel_losses') ? data['classic_duel_losses'] : 0,
      isOverall: false,
    );

    noDebuff = DuelsModeStats(
      kills: data.containsKey('potion_duel_kills') ? data['potion_duel_kills'] : 0,
      deaths: data.containsKey('potion_duel_deaths') ? data['potion_duel_deaths'] : 0,
      wins: data.containsKey('potion_duel_wins') ? data['potion_duel_wins'] : 0,
      losses: data.containsKey('potion_duel_losses') ? data['potion_duel_losses'] : 0,
      isOverall: false,
    );

    combo = DuelsModeStats(
      kills: data.containsKey('combo_duel_kills') ? data['combo_duel_kills'] : 0,
      deaths: data.containsKey('combo_duel_deaths') ? data['combo_duel_deaths'] : 0,
      wins: data.containsKey('combo_duel_wins') ? data['combo_duel_wins'] : 0,
      losses: data.containsKey('combo_duel_losses') ? data['combo_duel_losses'] : 0,
      isOverall: false,
    );

    boxing = DuelsModeStats(
      kills: data.containsKey('boxing_duel_kills') ? data['boxing_duel_kills'] : 0,
      deaths: data.containsKey('boxing_duel_deaths') ? data['boxing_duel_deaths'] : 0,
      wins: data.containsKey('boxing_duel_wins') ? data['boxing_duel_wins'] : 0,
      losses: data.containsKey('boxing_duel_losses') ? data['boxing_duel_losses'] : 0,
      isOverall: false,
    );

    parkour = DuelsModeStats(
      deaths: data.containsKey('parkour_eight_deaths') ? data['parkour_eight_deaths'] : 0,
      wins: data.containsKey('parkour_eight_wins') ? data['parkour_eight_wins'] : 0,
      losses: data.containsKey('parkour_eight_losses') ? data['parkour_eight_losses'] : 0,
      isOverall: false,
    );

    duelArena = DuelsModeStats(
      kills: data.containsKey('duel_arena_kills') ? data['duel_arena_kills'] : 0,
      deaths: data.containsKey('duel_arena_deaths') ? data['duel_arena_deaths'] : 0,
      wins: data.containsKey('duel_arena_wins') ? data['duel_arena_wins'] : 0,
      losses: data.containsKey('duel_arena_losses') ? data['duel_arena_losses'] : 0,
      isOverall: false,
    );

    bridge = DuelsModeStats(
      kills: data.containsKey('bridge_kills') ? data['bridge_kills'] : 0,
      deaths: data.containsKey('bridge_deaths') ? data['bridge_deaths'] : 0,
      wins: data.containsKey('bridge_duel_wins') ? data['bridge_duel_wins'] : 0,
      losses: data.containsKey('bridge_duel_losses') ? data['bridge_duel_losses'] : 0,
      isOverall: false,
    );
  }
}

class DuelsModeStats {
  final bool isOverall; //TODO: remove this

  final int kills;
  final int deaths;

  final int wins;
  final int losses;

  const DuelsModeStats({
    this.kills = 0,
    this.deaths = 0,
    this.wins = 0,
    this.losses = 0,
    this.isOverall = false,
  });

  String _toRoman(int nb) {
    return switch (nb) {
      0 => '',
      1 => 'II',
      2 => 'III',
      3 => 'IV',
      4 => 'V',
      5 => 'VI',
      6 => 'VII',
      7 => 'VIII',
      8 => 'IX',
      9 => 'X',
      10 => 'XI',
      11 => 'XII',
      12 => 'XIII',
      13 => 'XIV',
      14 => 'XV',
      15 => 'XVI',
      16 => 'XVII',
      17 => 'XVIII',
      18 => 'XIX',
      19 => 'XX',
      _ => ''
    };
  }

  String get formattedTitle {
    int eqWins = isOverall ? wins : wins * 2;
    return switch (eqWins) {
      < 100 => '',
      < 200 => '§8Rookie ${_toRoman((eqWins - 100) ~/ 20)}',
      < 500 => '§fIron ${_toRoman((eqWins - 200) ~/ 60)}',
      < 1000 => '§6Gold ${_toRoman((eqWins - 500) ~/ 100)}',
      < 2000 => '§3Diamond ${_toRoman((eqWins - 1000) ~/ 200)}',
      < 4000 => '§2Master ${_toRoman((eqWins - 2000) ~/ 400)}',
      < 10000 => '§4Legend ${_toRoman((eqWins - 4000) ~/ 1200)}',
      < 20000 => '§eGrandmaster ${_toRoman((eqWins - 10000) ~/ 2000)}',
      < 50000 => '§5Godlike ${_toRoman((eqWins - 20000) ~/ 6000)}',
      < 100000 => '§bCelestial ${_toRoman((eqWins - 50000) ~/ 10000)}',
      < 200000 => '§dDivine ${_toRoman((eqWins - 100000) ~/ 20000)}',
      >= 200000 => '§cAscended ${_toRoman((eqWins - 200000) ~/ 20000)}',
      _ => '',
    };
  }
}
