import 'package:hytracker/models/stat_record.dart';

class DuelsStats extends StatRecord {
  late final int coins;
  late final String prefix;
  late final DuelsModeStats overall;
  late final DuelsModeStats uhcSolo;
  late final DuelsModeStats uhcDoubles;
  late final DuelsModeStats uhcFours;
  late final DuelsModeStats opSolo;
  late final DuelsModeStats opDoubles;
  late final DuelsModeStats skywarsSolo;
  late final DuelsModeStats skywarsDoubles;
  late final DuelsModeStats megaWallsSolo;
  late final DuelsModeStats megaWallsDoubles;
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
  late final DuelsModeStatsBridge bridge1v1;
  late final DuelsModeStatsBridge bridge2v2;
  late final DuelsModeStatsBridge bridge3v3;
  late final DuelsModeStatsBridge bridge4v4;
  late final DuelsModeStatsBridge bridge2v2v2v2;
  late final DuelsModeStatsBridge bridge3v3v3v3;
  late final DuelsModeStatsBridge bridgeCapture;

  DuelsStats({
    this.coins = 0,
    this.prefix = '',
    this.overall = const DuelsModeStats(),
    this.uhcSolo = const DuelsModeStats(),
    this.uhcDoubles = const DuelsModeStats(),
    this.uhcFours = const DuelsModeStats(),
    this.opSolo = const DuelsModeStats(),
    this.opDoubles = const DuelsModeStats(),
    this.skywarsSolo = const DuelsModeStats(),
    this.skywarsDoubles = const DuelsModeStats(),
    this.megaWallsSolo = const DuelsModeStats(),
    this.megaWallsDoubles = const DuelsModeStats(),
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
    this.bridge1v1 = const DuelsModeStatsBridge(),
    this.bridge2v2 = const DuelsModeStatsBridge(),
    this.bridge3v3 = const DuelsModeStatsBridge(),
    this.bridge4v4 = const DuelsModeStatsBridge(),
    this.bridge2v2v2v2 = const DuelsModeStatsBridge(),
    this.bridge3v3v3v3 = const DuelsModeStatsBridge(),
    this.bridgeCapture = const DuelsModeStatsBridge(),
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

    uhcSolo = DuelsModeStats(
      kills: data.containsKey('uhc_duel_kills') ? data['uhc_duel_kills'] : 0,
      deaths: data.containsKey('uhc_duel_deaths') ? data['uhc_duel_deaths'] : 0,
      wins: data.containsKey('uhc_duel_wins') ? data['uhc_duel_wins'] : 0,
      losses: data.containsKey('uhc_duel_losses') ? data['uhc_duel_losses'] : 0,
    );
    uhcDoubles = DuelsModeStats(
      kills: data.containsKey('uhc_doubles_kills') ? data['uhc_doubles_kills'] : 0,
      deaths: data.containsKey('uhc_doubles_deaths') ? data['uhc_doubles_deaths'] : 0,
      wins: data.containsKey('uhc_doubles_wins') ? data['uhc_doubles_wins'] : 0,
      losses: data.containsKey('uhc_doubles_losses') ? data['uhc_doubles_losses'] : 0,
    );
    uhcFours = DuelsModeStats(
      kills: data.containsKey('uhc_four_kills') ? data['uhc_four_kills'] : 0,
      deaths: data.containsKey('uhc_four_deaths') ? data['uhc_four_deaths'] : 0,
      wins: data.containsKey('uhc_four_wins') ? data['uhc_four_wins'] : 0,
      losses: data.containsKey('uhc_four_losses') ? data['uhc_four_losses'] : 0,
    );

    opSolo = DuelsModeStats(
      kills: data.containsKey('op_duel_kills') ? data['op_duel_kills'] : 0,
      deaths: data.containsKey('op_duel_deaths') ? data['op_duel_deaths'] : 0,
      wins: data.containsKey('op_duel_wins') ? data['op_duel_wins'] : 0,
      losses: data.containsKey('op_duel_losses') ? data['op_duel_losses'] : 0,
    );
    opDoubles = DuelsModeStats(
      kills: data.containsKey('op_doubles_kills') ? data['op_doubles_kills'] : 0,
      deaths: data.containsKey('op_doubles_deaths') ? data['op_doubles_deaths'] : 0,
      wins: data.containsKey('op_doubles_wins') ? data['op_doubles_wins'] : 0,
      losses: data.containsKey('op_doubles_losses') ? data['op_doubles_losses'] : 0,
    );

    skywarsSolo = DuelsModeStats(
      kills: data.containsKey('sw_duel_kills') ? data['sw_duel_kills'] : 0,
      deaths: data.containsKey('sw_duel_deaths') ? data['sw_duel_deaths'] : 0,
      wins: data.containsKey('sw_duel_wins') ? data['sw_duel_wins'] : 0,
      losses: data.containsKey('sw_duel_losses') ? data['sw_duel_losses'] : 0,
    );
    skywarsDoubles = DuelsModeStats(
      kills: data.containsKey('sw_doubles_kills') ? data['sw_doubles_kills'] : 0,
      deaths: data.containsKey('sw_doubles_deaths') ? data['sw_doubles_deaths'] : 0,
      wins: data.containsKey('sw_doubles_wins') ? data['sw_doubles_wins'] : 0,
      losses: data.containsKey('sw_doubles_losses') ? data['sw_doubles_losses'] : 0,
    );

    megaWallsSolo = DuelsModeStats(
      kills: data.containsKey('mw_duel_kills') ? data['mw_duel_kills'] : 0,
      deaths: data.containsKey('mw_duel_deaths') ? data['mw_duel_deaths'] : 0,
      wins: data.containsKey('mw_duel_wins') ? data['mw_duel_wins'] : 0,
      losses: data.containsKey('mw_duel_losses') ? data['mw_duel_losses'] : 0,
    );
    megaWallsDoubles = DuelsModeStats(
      kills: data.containsKey('mw_doubles_kills') ? data['mw_doubles_kills'] : 0,
      deaths: data.containsKey('mw_doubles_deaths') ? data['mw_doubles_deaths'] : 0,
      wins: data.containsKey('mw_doubles_wins') ? data['mw_doubles_wins'] : 0,
      losses: data.containsKey('mw_doubles_losses') ? data['mw_doubles_losses'] : 0,
    );

    bow = DuelsModeStats(
      kills: data.containsKey('bow_duel_kills') ? data['bow_duel_kills'] : 0,
      deaths: data.containsKey('bow_duel_deaths') ? data['bow_duel_deaths'] : 0,
      wins: data.containsKey('bow_duel_wins') ? data['bow_duel_wins'] : 0,
      losses: data.containsKey('bow_duel_losses') ? data['bow_duel_losses'] : 0,
    );

    blitz = DuelsModeStats(
      kills: data.containsKey('blitz_duel_kills') ? data['blitz_duel_kills'] : 0,
      deaths: data.containsKey('blitz_duel_deaths') ? data['blitz_duel_deaths'] : 0,
      wins: data.containsKey('blitz_duel_wins') ? data['blitz_duel_wins'] : 0,
      losses: data.containsKey('blitz_duel_losses') ? data['blitz_duel_losses'] : 0,
    );

    sumo = DuelsModeStats(
      kills: data.containsKey('sumo_duel_kills') ? data['sumo_duel_kills'] : 0,
      deaths: data.containsKey('sumo_duel_deaths') ? data['sumo_duel_deaths'] : 0,
      wins: data.containsKey('sumo_duel_wins') ? data['sumo_duel_wins'] : 0,
      losses: data.containsKey('sumo_duel_losses') ? data['sumo_duel_losses'] : 0,
    );

    bowspleef = DuelsModeStats(
      kills: data.containsKey('bowspleef_duel_kills') ? data['bowspleef_duel_kills'] : 0,
      deaths: data.containsKey('bowspleef_duel_deaths') ? data['bowspleef_duel_deaths'] : 0,
      wins: data.containsKey('bowspleef_duel_wins') ? data['bowspleef_duel_wins'] : 0,
      losses: data.containsKey('bowspleef_duel_losses') ? data['bowspleef_duel_losses'] : 0,
    );

    classic = DuelsModeStats(
      kills: data.containsKey('classic_duel_kills') ? data['classic_duel_kills'] : 0,
      deaths: data.containsKey('classic_duel_deaths') ? data['classic_duel_deaths'] : 0,
      wins: data.containsKey('classic_duel_wins') ? data['classic_duel_wins'] : 0,
      losses: data.containsKey('classic_duel_losses') ? data['classic_duel_losses'] : 0,
    );

    noDebuff = DuelsModeStats(
      kills: data.containsKey('potion_duel_kills') ? data['potion_duel_kills'] : 0,
      deaths: data.containsKey('potion_duel_deaths') ? data['potion_duel_deaths'] : 0,
      wins: data.containsKey('potion_duel_wins') ? data['potion_duel_wins'] : 0,
      losses: data.containsKey('potion_duel_losses') ? data['potion_duel_losses'] : 0,
    );

    combo = DuelsModeStats(
      kills: data.containsKey('combo_duel_kills') ? data['combo_duel_kills'] : 0,
      deaths: data.containsKey('combo_duel_deaths') ? data['combo_duel_deaths'] : 0,
      wins: data.containsKey('combo_duel_wins') ? data['combo_duel_wins'] : 0,
      losses: data.containsKey('combo_duel_losses') ? data['combo_duel_losses'] : 0,
    );

    boxing = DuelsModeStats(
      kills: data.containsKey('boxing_duel_kills') ? data['boxing_duel_kills'] : 0,
      deaths: data.containsKey('boxing_duel_deaths') ? data['boxing_duel_deaths'] : 0,
      wins: data.containsKey('boxing_duel_wins') ? data['boxing_duel_wins'] : 0,
      losses: data.containsKey('boxing_duel_losses') ? data['boxing_duel_losses'] : 0,
    );

    parkour = DuelsModeStats(
      deaths: data.containsKey('parkour_eight_deaths') ? data['parkour_eight_deaths'] : 0,
      wins: data.containsKey('parkour_eight_wins') ? data['parkour_eight_wins'] : 0,
      losses: data.containsKey('parkour_eight_losses') ? data['parkour_eight_losses'] : 0,
    );

    duelArena = DuelsModeStats(
      kills: data.containsKey('duel_arena_kills') ? data['duel_arena_kills'] : 0,
      deaths: data.containsKey('duel_arena_deaths') ? data['duel_arena_deaths'] : 0,
      wins: data.containsKey('duel_arena_wins') ? data['duel_arena_wins'] : 0,
      losses: data.containsKey('duel_arena_losses') ? data['duel_arena_losses'] : 0,
    );

    bridge1v1 = DuelsModeStatsBridge(
      kills: data.containsKey('bridge_duel_bridge_kills') ? data['bridge_duel_bridge_kills'] : 0,
      deaths: data.containsKey('bridge_duel_bridge_deaths') ? data['bridge_duel_bridge_deaths'] : 0,
      wins: data.containsKey('bridge_duel_wins') ? data['bridge_duel_wins'] : 0,
      losses: data.containsKey('bridge_duel_losses') ? data['bridge_duel_losses'] : 0,
      scores: data.containsKey('bridge_duel_goals') ? data['bridge_duel_goals'] : 0,
    );
    bridge2v2 = DuelsModeStatsBridge(
      kills: data.containsKey('bridge_doubles_bridge_kills') ? data['bridge_doubles_bridge_kills'] : 0,
      deaths: data.containsKey('bridge_doubles_bridge_deaths') ? data['bridge_doubles_bridge_deaths'] : 0,
      wins: data.containsKey('bridge_doubles_wins') ? data['bridge_doubles_wins'] : 0,
      losses: data.containsKey('bridge_doubles_losses') ? data['bridge_doubles_losses'] : 0,
      scores: data.containsKey('bridge_doubles_goals') ? data['bridge_doubles_goals'] : 0,
    );
    bridge3v3 = DuelsModeStatsBridge(
      kills: data.containsKey('bridge_threes_bridge_kills') ? data['bridge_threes_bridge_kills'] : 0,
      deaths: data.containsKey('bridge_threes_bridge_deaths') ? data['bridge_threes_bridge_deaths'] : 0,
      wins: data.containsKey('bridge_threes_wins') ? data['bridge_threes_wins'] : 0,
      losses: data.containsKey('bridge_threes_losses') ? data['bridge_threes_losses'] : 0,
      scores: data.containsKey('bridge_threes_goals') ? data['bridge_threes_goals'] : 0,
    );
    bridge4v4 = DuelsModeStatsBridge(
      kills: data.containsKey('bridge_four_bridge_kills') ? data['bridge_four_bridge_kills'] : 0,
      deaths: data.containsKey('bridge_four_bridge_deaths') ? data['bridge_four_bridge_deaths'] : 0,
      wins: data.containsKey('bridge_four_wins') ? data['bridge_four_wins'] : 0,
      losses: data.containsKey('bridge_four_losses') ? data['bridge_four_losses'] : 0,
      scores: data.containsKey('bridge_four_goals') ? data['bridge_four_goals'] : 0,
    );
    bridge2v2v2v2 = DuelsModeStatsBridge(
      kills: data.containsKey('bridge_2v2v2v2_bridge_kills') ? data['bridge_2v2v2v2_bridge_kills'] : 0,
      deaths: data.containsKey('bridge_2v2v2v2_bridge_deaths') ? data['bridge_2v2v2v2_bridge_deaths'] : 0,
      wins: data.containsKey('bridge_2v2v2v2_wins') ? data['bridge_2v2v2v2_wins'] : 0,
      losses: data.containsKey('bridge_2v2v2v2_losses') ? data['bridge_2v2v2v2_losses'] : 0,
      scores: data.containsKey('bridge_2v2v2v2_goals') ? data['bridge_2v2v2v2_goals'] : 0,
    );
    bridge3v3v3v3 = DuelsModeStatsBridge(
      kills: data.containsKey('bridge_3v3v3v3_bridge_kills') ? data['bridge_3v3v3v3_bridge_kills'] : 0,
      deaths: data.containsKey('bridge_3v3v3v3_bridge_deaths') ? data['bridge_3v3v3v3_bridge_deaths'] : 0,
      wins: data.containsKey('bridge_3v3v3v3_wins') ? data['bridge_3v3v3v3_wins'] : 0,
      losses: data.containsKey('bridge_3v3v3v3_losses') ? data['bridge_3v3v3v3_losses'] : 0,
      scores: data.containsKey('bridge_3v3v3v3_goals') ? data['bridge_3v3v3v3_goals'] : 0,
    );
    bridgeCapture = DuelsModeStatsBridge(
      kills: data.containsKey('capture_threes_bridge_kills') ? data['capture_threes_bridge_kills'] : 0,
      deaths: data.containsKey('capture_threes_bridge_deaths') ? data['capture_threes_bridge_deaths'] : 0,
      wins: data.containsKey('capture_threes_wins') ? data['capture_threes_wins'] : 0,
      losses: data.containsKey('capture_threes_losses') ? data['capture_threes_losses'] : 0,
      scores: data.containsKey('captures') ? data['captures '] : 0,
    );
  }

  DuelsModeStats get uhcOverall => DuelsModeStats(
        kills: uhcSolo.kills + uhcDoubles.kills + uhcFours.kills,
        deaths: uhcSolo.deaths + uhcDoubles.deaths + uhcFours.deaths,
        wins: uhcSolo.wins + uhcDoubles.wins + uhcFours.wins,
        losses: uhcSolo.losses + uhcDoubles.losses + uhcFours.losses,
      );

  DuelsModeStats get opOverall => DuelsModeStats(
        kills: opSolo.kills + opDoubles.kills,
        deaths: opSolo.deaths + opDoubles.deaths,
        wins: opSolo.wins + opDoubles.wins,
        losses: opSolo.losses + opDoubles.losses,
      );

  DuelsModeStats get skywarsOverall => DuelsModeStats(
        kills: skywarsSolo.kills + skywarsDoubles.kills,
        deaths: skywarsSolo.deaths + skywarsDoubles.deaths,
        wins: skywarsSolo.wins + skywarsDoubles.wins,
        losses: skywarsSolo.losses + skywarsDoubles.losses,
      );

  DuelsModeStats get megaWallsOverall => DuelsModeStats(
        kills: megaWallsSolo.kills + megaWallsDoubles.kills,
        deaths: megaWallsSolo.deaths + megaWallsDoubles.deaths,
        wins: megaWallsSolo.wins + megaWallsDoubles.wins,
        losses: megaWallsSolo.losses + megaWallsDoubles.losses,
      );
  DuelsModeStatsBridge get bridgeOverall => DuelsModeStatsBridge(
        kills: bridge1v1.kills +
            bridge2v2.kills +
            bridge3v3.kills +
            bridge4v4.kills +
            bridge2v2v2v2.kills +
            bridge3v3v3v3.kills +
            bridgeCapture.kills,
        deaths: bridge1v1.deaths +
            bridge2v2.deaths +
            bridge3v3.deaths +
            bridge4v4.deaths +
            bridge2v2v2v2.deaths +
            bridge3v3v3v3.deaths +
            bridgeCapture.deaths,
        wins: bridge1v1.wins +
            bridge2v2.wins +
            bridge3v3.wins +
            bridge4v4.wins +
            bridge2v2v2v2.wins +
            bridge3v3v3v3.wins +
            bridgeCapture.wins,
        losses: bridge1v1.losses +
            bridge2v2.losses +
            bridge3v3.losses +
            bridge4v4.losses +
            bridge2v2v2v2.losses +
            bridge3v3v3v3.losses +
            bridgeCapture.losses,
        scores: bridge1v1.scores +
            bridge2v2.scores +
            bridge3v3.scores +
            bridge4v4.scores +
            bridge2v2v2v2.scores +
            bridge3v3v3v3.scores +
            bridgeCapture.scores,
      );
}

class DuelsModeStats {
  final bool isOverall;

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

class DuelsModeStatsBridge extends DuelsModeStats {
  @override
  final bool isOverall = false;

  final int scores;
  const DuelsModeStatsBridge({
    super.kills = 0,
    super.deaths = 0,
    super.wins = 0,
    super.losses = 0,
    this.scores = 0,
  });
}
