class DuelsStats {
  final int coins;
  final String prefix;
  final DuelsModeStats overall;
  final DuelsModeStats uhcSolo;
  final DuelsModeStats uhcDoubles;
  final DuelsModeStats uhcFours;
  final DuelsModeStats opSolo;
  final DuelsModeStats opDoubles;
  final DuelsModeStats skywarsSolo;
  final DuelsModeStats skywarsDoubles;
  final DuelsModeStats megaWallsSolo;
  final DuelsModeStats megaWallsDoubles;
  final DuelsModeStats bow;
  final DuelsModeStats blitz;
  final DuelsModeStats sumo;
  final DuelsModeStats bowspleef;
  final DuelsModeStats classic;
  final DuelsModeStats noDebuff;
  final DuelsModeStats combo;
  final DuelsModeStats boxing;
  final DuelsModeStats parkour;
  final DuelsModeStats duelArena;
  final DuelsModeStatsBridge bridge1v1;
  final DuelsModeStatsBridge bridge2v2;
  final DuelsModeStatsBridge bridge3v3;
  final DuelsModeStatsBridge bridge4v4;
  final DuelsModeStatsBridge bridge2v2v2v2;
  final DuelsModeStatsBridge bridge3v3v3v3;
  final DuelsModeStatsBridge bridgeCapture;

  const DuelsStats({
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

  DuelsStats.fromRawData(Map<String, dynamic> data)
      : coins = data['coins'] ?? 0,
        prefix = '', //TODO

        overall = DuelsModeStats(
          kills: data['kills'] ?? 0,
          deaths: data['deaths'] ?? 0,
          wins: data['wins'] ?? 0,
          losses: data['losses'] ?? 0,
          isOverall: true,
        ),
        uhcSolo = DuelsModeStats(
          kills: data['uhc_duel_kills'] ?? 0,
          deaths: data['uhc_duel_deaths'] ?? 0,
          wins: data['uhc_duel_wins'] ?? 0,
          losses: data['uhc_duel_losses'] ?? 0,
        ),
        uhcDoubles = DuelsModeStats(
          kills: data['uhc_doubles_kills'] ?? 0,
          deaths: data['uhc_doubles_deaths'] ?? 0,
          wins: data['uhc_doubles_wins'] ?? 0,
          losses: data['uhc_doubles_losses'] ?? 0,
        ),
        uhcFours = DuelsModeStats(
          kills: data['uhc_four_kills'] ?? 0,
          deaths: data['uhc_four_deaths'] ?? 0,
          wins: data['uhc_four_wins'] ?? 0,
          losses: data['uhc_four_losses'] ?? 0,
        ),
        opSolo = DuelsModeStats(
          kills: data['op_duel_kills'] ?? 0,
          deaths: data['op_duel_deaths'] ?? 0,
          wins: data['op_duel_wins'] ?? 0,
          losses: data['op_duel_losses'] ?? 0,
        ),
        opDoubles = DuelsModeStats(
          kills: data['op_doubles_kills'] ?? 0,
          deaths: data['op_doubles_deaths'] ?? 0,
          wins: data['op_doubles_wins'] ?? 0,
          losses: data['op_doubles_losses'] ?? 0,
        ),
        skywarsSolo = DuelsModeStats(
          kills: data['sw_duel_kills'] ?? 0,
          deaths: data['sw_duel_deaths'] ?? 0,
          wins: data['sw_duel_wins'] ?? 0,
          losses: data['sw_duel_losses'] ?? 0,
        ),
        skywarsDoubles = DuelsModeStats(
          kills: data['sw_doubles_kills'] ?? 0,
          deaths: data['sw_doubles_deaths'] ?? 0,
          wins: data['sw_doubles_wins'] ?? 0,
          losses: data['sw_doubles_losses'] ?? 0,
        ),
        megaWallsSolo = DuelsModeStats(
          kills: data['mw_duel_kills'] ?? 0,
          deaths: data['mw_duel_deaths'] ?? 0,
          wins: data['mw_duel_wins'] ?? 0,
          losses: data['mw_duel_losses'] ?? 0,
        ),
        megaWallsDoubles = DuelsModeStats(
          kills: data['mw_doubles_kills'] ?? 0,
          deaths: data['mw_doubles_deaths'] ?? 0,
          wins: data['mw_doubles_wins'] ?? 0,
          losses: data['mw_doubles_losses'] ?? 0,
        ),
        bow = DuelsModeStats(
          kills: data['bow_duel_kills'] ?? 0,
          deaths: data['bow_duel_deaths'] ?? 0,
          wins: data['bow_duel_wins'] ?? 0,
          losses: data['bow_duel_losses'] ?? 0,
        ),
        blitz = DuelsModeStats(
          kills: data['blitz_duel_kills'] ?? 0,
          deaths: data['blitz_duel_deaths'] ?? 0,
          wins: data['blitz_duel_wins'] ?? 0,
          losses: data['blitz_duel_losses'] ?? 0,
        ),
        sumo = DuelsModeStats(
          kills: data['sumo_duel_kills'] ?? 0,
          deaths: data['sumo_duel_deaths'] ?? 0,
          wins: data['sumo_duel_wins'] ?? 0,
          losses: data['sumo_duel_losses'] ?? 0,
        ),
        bowspleef = DuelsModeStats(
          kills: data['bowspleef_duel_kills'] ?? 0,
          deaths: data['bowspleef_duel_deaths'] ?? 0,
          wins: data['bowspleef_duel_wins'] ?? 0,
          losses: data['bowspleef_dueTODO: maybe nest to handle other stylesl_losses'] ?? 0,
        ),
        classic = DuelsModeStats(
          kills: data['classic_duel_kills'] ?? 0,
          deaths: data['classic_duel_deaths'] ?? 0,
          wins: data['classic_duel_wins'] ?? 0,
          losses: data['classic_duel_losses'] ?? 0,
        ),
        noDebuff = DuelsModeStats(
          kills: data['potion_duel_kills'] ?? 0,
          deaths: data['potion_duel_deaths'] ?? 0,
          wins: data['potion_duel_wins'] ?? 0,
          losses: data['potion_duel_losses'] ?? 0,
        ),
        combo = DuelsModeStats(
          kills: data['combo_duel_kills'] ?? 0,
          deaths: data['combo_duel_deaths'] ?? 0,
          wins: data['combo_duel_wins'] ?? 0,
          losses: data['combo_duel_losses'] ?? 0,
        ),
        boxing = DuelsModeStats(
          kills: data['boxing_duel_kills'] ?? 0,
          deaths: data['boxing_duel_deaths'] ?? 0,
          wins: data['boxing_duel_wins'] ?? 0,
          losses: data['boxing_duel_losses'] ?? 0,
        ),
        parkour = DuelsModeStats(
          deaths: data['parkour_eight_deaths'] ?? 0,
          wins: data['parkour_eight_wins'] ?? 0,
          losses: data['parkour_eight_losses'] ?? 0,
        ),
        duelArena = DuelsModeStats(
          kills: data['duel_arena_kills'] ?? 0,
          deaths: data['duel_arena_deaths'] ?? 0,
          wins: data['duel_arena_wins'] ?? 0,
          losses: data['duel_arena_losses'] ?? 0,
        ),
        bridge1v1 = DuelsModeStatsBridge(
          kills: data['bridge_duel_bridge_kills'] ?? 0,
          deaths: data['bridge_duel_bridge_deaths'] ?? 0,
          wins: data['bridge_duel_wins'] ?? 0,
          losses: data['bridge_duel_losses'] ?? 0,
          scores: data['bridge_duel_goals'] ?? 0,
        ),
        bridge2v2 = DuelsModeStatsBridge(
          kills: data['bridge_doubles_bridge_kills'] ?? 0,
          deaths: data['bridge_doubles_bridge_deaths'] ?? 0,
          wins: data['bridge_doubles_wins'] ?? 0,
          losses: data['bridge_doubles_losses'] ?? 0,
          scores: data['bridge_doubles_goals'] ?? 0,
        ),
        bridge3v3 = DuelsModeStatsBridge(
          kills: data['bridge_threes_bridge_kills'] ?? 0,
          deaths: data['bridge_threes_bridge_deaths'] ?? 0,
          wins: data['bridge_threes_wins'] ?? 0,
          losses: data['bridge_threes_losses'] ?? 0,
          scores: data['bridge_threes_goals'] ?? 0,
        ),
        bridge4v4 = DuelsModeStatsBridge(
          kills: data['bridge_four_bridge_kills'] ?? 0,
          deaths: data['bridge_four_bridge_deaths'] ?? 0,
          wins: data['bridge_four_wins'] ?? 0,
          losses: data['bridge_four_losses'] ?? 0,
          scores: data['bridge_four_goals'] ?? 0,
        ),
        bridge2v2v2v2 = DuelsModeStatsBridge(
          kills: data['bridge_2v2v2v2_bridge_kills'] ?? 0,
          deaths: data['bridge_2v2v2v2_bridge_deaths'] ?? 0,
          wins: data['bridge_2v2v2v2_wins'] ?? 0,
          losses: data['bridge_2v2v2v2_losses'] ?? 0,
          scores: data['bridge_2v2v2v2_goals'] ?? 0,
        ),
        bridge3v3v3v3 = DuelsModeStatsBridge(
          kills: data['bridge_3v3v3v3_bridge_kills'] ?? 0,
          deaths: data['bridge_3v3v3v3_bridge_deaths'] ?? 0,
          wins: data['bridge_3v3v3v3_wins'] ?? 0,
          losses: data['bridge_3v3v3v3_losses'] ?? 0,
          scores: data['bridge_3v3v3v3_goals'] ?? 0,
        ),
        bridgeCapture = DuelsModeStatsBridge(
          kills: data['capture_threes_bridge_kills'] ?? 0,
          deaths: data['capture_threes_bridge_deaths'] ?? 0,
          wins: data['capture_threes_wins'] ?? 0,
          losses: data['capture_threes_losses'] ?? 0,
          scores: data['captures '] ?? 0,
        );
  // Serialization: Convert DuelsStats to JSON
  Map<String, dynamic> toJson() {
    return {
      'coins': coins,
      'prefix': prefix,
      'overall': overall.toJson(),
      'uhcSolo': uhcSolo.toJson(),
      'uhcDoubles': uhcDoubles.toJson(),
      'uhcFours': uhcFours.toJson(),
      'opSolo': opSolo.toJson(),
      'opDoubles': opDoubles.toJson(),
      'skywarsSolo': skywarsSolo.toJson(),
      'skywarsDoubles': skywarsDoubles.toJson(),
      'megaWallsSolo': megaWallsSolo.toJson(),
      'megaWallsDoubles': megaWallsDoubles.toJson(),
      'bow': bow.toJson(),
      'blitz': blitz.toJson(),
      'sumo': sumo.toJson(),
      'bowspleef': bowspleef.toJson(),
      'classic': classic.toJson(),
      'noDebuff': noDebuff.toJson(),
      'combo': combo.toJson(),
      'boxing': boxing.toJson(),
      'parkour': parkour.toJson(),
      'duelArena': duelArena.toJson(),
      'bridge1v1': bridge1v1.toJson(),
      'bridge2v2': bridge2v2.toJson(),
      'bridge3v3': bridge3v3.toJson(),
      'bridge4v4': bridge4v4.toJson(),
      'bridge2v2v2v2': bridge2v2v2v2.toJson(),
      'bridge3v3v3v3': bridge3v3v3v3.toJson(),
      'bridgeCapture': bridgeCapture.toJson(),
    };
  }

  // Deserialization: Create DuelsStats from JSON
  factory DuelsStats.fromJson(Map<String, dynamic> json) {
    return DuelsStats(
      coins: json['coins'],
      prefix: json['prefix'],
      overall: DuelsModeStats.fromJson(json['overall']),
      uhcSolo: DuelsModeStats.fromJson(json['uhcSolo']),
      uhcDoubles: DuelsModeStats.fromJson(json['uhcDoubles']),
      uhcFours: DuelsModeStats.fromJson(json['uhcFours']),
      opSolo: DuelsModeStats.fromJson(json['opSolo']),
      opDoubles: DuelsModeStats.fromJson(json['opDoubles']),
      skywarsSolo: DuelsModeStats.fromJson(json['skywarsSolo']),
      skywarsDoubles: DuelsModeStats.fromJson(json['skywarsDoubles']),
      megaWallsSolo: DuelsModeStats.fromJson(json['megaWallsSolo']),
      megaWallsDoubles: DuelsModeStats.fromJson(json['megaWallsDoubles']),
      bow: DuelsModeStats.fromJson(json['bow']),
      blitz: DuelsModeStats.fromJson(json['blitz']),
      sumo: DuelsModeStats.fromJson(json['sumo']),
      bowspleef: DuelsModeStats.fromJson(json['bowspleef']),
      classic: DuelsModeStats.fromJson(json['classic']),
      noDebuff: DuelsModeStats.fromJson(json['noDebuff']),
      combo: DuelsModeStats.fromJson(json['combo']),
      boxing: DuelsModeStats.fromJson(json['boxing']),
      parkour: DuelsModeStats.fromJson(json['parkour']),
      duelArena: DuelsModeStats.fromJson(json['duelArena']),
      bridge1v1: DuelsModeStatsBridge.fromJson(json['bridge1v1']),
      bridge2v2: DuelsModeStatsBridge.fromJson(json['bridge2v2']),
      bridge3v3: DuelsModeStatsBridge.fromJson(json['bridge3v3']),
      bridge4v4: DuelsModeStatsBridge.fromJson(json['bridge4v4']),
      bridge2v2v2v2: DuelsModeStatsBridge.fromJson(json['bridge2v2v2v2']),
      bridge3v3v3v3: DuelsModeStatsBridge.fromJson(json['bridge3v3v3v3']),
      bridgeCapture: DuelsModeStatsBridge.fromJson(json['bridgeCapture']),
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

  double get wlRatio {
    return losses == 0 ? wins.toDouble() : wins / losses;
  }

  double get kdRatio {
    return deaths == 0 ? kills.toDouble() : kills / deaths;
  }

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
      < 100 => '-',
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
      _ => '-',
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'isOverall': isOverall,
      'kills': kills,
      'deaths': deaths,
      'wins': wins,
      'losses': losses,
    };
  }

  factory DuelsModeStats.fromJson(Map<String, dynamic> json) {
    return DuelsModeStats(
      isOverall: json['isOverall'] ?? false,
      kills: json['kills'] ?? 0,
      deaths: json['deaths'] ?? 0,
      wins: json['wins'] ?? 0,
      losses: json['losses'] ?? 0,
    );
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'kills': kills,
      'deaths': deaths,
      'wins': wins,
      'losses': losses,
      'scores': scores,
    };
  }

  factory DuelsModeStatsBridge.fromJson(Map<String, dynamic> json) {
    return DuelsModeStatsBridge(
      kills: json['kills'] ?? 0,
      deaths: json['deaths'] ?? 0,
      wins: json['wins'] ?? 0,
      losses: json['losses'] ?? 0,
      scores: json['scores'] ?? 0,
    );
  }
}
