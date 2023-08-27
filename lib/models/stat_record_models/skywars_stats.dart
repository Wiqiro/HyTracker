import 'package:hytracker/models/stat_record.dart';

class SkywarsStats extends StatRecord {
  final int experience;
  final String _icon;

  final int opals;
  final int shards;
  final int angelOfDeath;
  final int coins;

  final SkywarsModeStats overall;
  final SkywarsModeStats soloNormal;
  final SkywarsModeStats soloInsane;
  final SkywarsModeStats teamNormal;
  final SkywarsModeStats teamInsane;

  SkywarsStats({
    this.experience = 0,
    this.opals = 0,
    this.shards = 0,
    this.angelOfDeath = 0,
    this.coins = 0,
    this.overall = const SkywarsModeStats(),
    this.soloNormal = const SkywarsModeStats(),
    this.soloInsane = const SkywarsModeStats(),
    this.teamNormal = const SkywarsModeStats(),
    this.teamInsane = const SkywarsModeStats(),
    String icon = '⋆',
  })  : _icon = icon,
        super.fromRawData();

  SkywarsStats.fromRawData(Map<String, dynamic> data)
      : experience = data['skywars_experience'].toInt() ?? 0,
        _icon = switch (data['selected_prestige_icon'] ?? 'default') {
          'default' => '⋆',
          'angel_1' => '★',
          'angel_2' => '☆',
          'angel_3' => '⁕',
          'angel_4' => '✶',
          'angel_5' => '✳',
          'angel_6' => '✴',
          'angel_7' => '✷',
          'angel_8' => '❋',
          'angel_9' => '✼',
          'angel_10' => '❂',
          'angel_11' => '❁',
          'angel_12' => '☬',
          'iron_prestige' => '✙',
          'gold_prestige' => '❤',
          'diamond_prestige' => '☠',
          'emerald_prestige' => '✦',
          'sapphire_prestige' => '✌',
          'ruby_prestige' => '❦',
          'crystal_prestige' => '✵',
          'opal_prestige' => '❣',
          'amethyst_prestige' => '☯',
          'rainbow_prestige' => '✺',
          'first_class_prestige' => '★',
          'assassin_prestige' => '★',
          'veteran_prestige' => '★',
          'god_like_prestige' => '★',
          'warrior_prestige' => '★',
          'captain_prestige' => '★',
          'soldier_prestige' => '★',
          'infantry_prestige' => '★',
          'sergeant_prestige' => '★',
          'lieutenant_prestige' => '★',
          'admiral_prestige' => '★',
          'general_prestige' => '★',
          'villain_prestige' => '★',
          'skilled_prestige' => '★',
          'sneaky_prestige' => '★',
          'overlord_prestige' => '★',
          'war_chief_prestige' => '★',
          'warlock_prestige' => '★',
          'emperor_prestige' => '★',
          'mythic_prestige' => 'ಠ_ಠ',
          'favor_icon' => '⚔​',
          'omega_icon' => 'Ω​',
          _ => '⋆'
        },
        opals = data['opals'] ?? 0,
        shards = data['shard'] ?? 0,
        angelOfDeath = data['angel_of_death_level'] ?? 0,
        coins = data['coins'] ?? 0,
        overall = SkywarsModeStats(
          kills: data['kills'] ?? 0,
          deaths: data['deaths'] ?? 0,
          wins: data['wins'] ?? 0,
          losses: data['losses'] ?? 0,
        ),
        soloNormal = SkywarsModeStats(
          kills: data['kills_solo_normal'] ?? 0,
          deaths: data['deaths_solo_normal'] ?? 0,
          wins: data['wins_solo_normal'] ?? 0,
          losses: data['losses_solo_normal'] ?? 0,
        ),
        soloInsane = SkywarsModeStats(
          kills: data['kills_solo_insane'] ?? 0,
          deaths: data['deaths_solo_insane'] ?? 0,
          wins: data['wins_solo_insane'] ?? 0,
          losses: data['losses_solo_insane'] ?? 0,
        ),
        teamNormal = SkywarsModeStats(
          kills: data['kills_team_normal'] ?? 0,
          deaths: data['deaths_team_normal'] ?? 0,
          wins: data['wins_team_normal'] ?? 0,
          losses: data['losses_team_normal'] ?? 0,
        ),
        teamInsane = SkywarsModeStats(
          kills: data['kills'] ?? 0,
          deaths: data['deaths'] ?? 0,
          wins: data['wins'] ?? 0,
          losses: data['losses'] ?? 0,
        ),
        super.fromRawData();

  String get prefix {
    var lvlStr = level.toInt().toString();

    return switch (level.toInt()) {
      < 5 => '§7[$lvlStr$_icon]',
      < 10 => '§f[$lvlStr$_icon]',
      < 15 => '§6[$lvlStr$_icon]',
      < 20 => '§b[$lvlStr$_icon]',
      < 25 => '§2[$lvlStr$_icon]',
      < 30 => '§3[$lvlStr$_icon]',
      < 35 => '§4[$lvlStr$_icon]',
      < 40 => '§d[$lvlStr$_icon]',
      < 45 => '§9[$lvlStr$_icon]',
      < 50 => '§5[$lvlStr$_icon]',
      < 55 => '§c[§6${lvlStr[0]}§e${lvlStr[1]}§a$_icon§b]',
      < 60 => '§7[§f$lvlStr$_icon§7]',
      < 65 => '§4[§c$lvlStr$_icon§4]',
      < 70 => '§c[§f$lvlStr$_icon§c]',
      < 75 => '§e[§6$lvlStr$_icon§e]',
      < 80 => '§f[§9$lvlStr$_icon§f]',
      < 85 => '§f[§b$lvlStr$_icon§f]',
      < 90 => '§f[§3$lvlStr$_icon§f]',
      < 95 => '§a[§3$lvlStr$_icon§a]',
      < 100 => '§c[§e$lvlStr$_icon§c]',
      < 105 => '§9[§1$lvlStr$_icon§9]',
      < 110 => '§6[§4$lvlStr$_icon§6]',
      < 115 => '§1[§b$lvlStr$_icon§1]',
      < 120 => '§8[§7$lvlStr$_icon§8]',
      < 125 => '§d[§5$lvlStr$_icon§d]',
      < 130 => '§f[§e$lvlStr$_icon§f]',
      < 135 => '§c[§e$lvlStr$_icon§c]',
      < 140 => '§6[§c$lvlStr$_icon§6]',
      < 145 => '§a[§c$lvlStr$_icon§a]',
      < 150 => '§a[§b$lvlStr$_icon§a]',
      >= 150 => _icon == 'ಠ_ಠ'
          ? '§c[§6${lvlStr[0]}§e${lvlStr[1]}§a${lvlStr[2]}§bಠ§d_§5ಠ§c]'
          : '§c[§6${lvlStr[0]}§e${lvlStr[1]}§a${lvlStr[2]}§b$_icon§c]',
      _ => '§7[$lvlStr$_icon]'
    };
  }

  double get level {
    return switch (experience) {
      < 20 => 1 + (experience / 20),
      < 70 => 2 + (experience - 20) / 50,
      < 150 => 3 + (experience - 70) / 80,
      < 250 => 4 + (experience - 150) / 100,
      < 500 => 5 + (experience - 250) / 250,
      < 1000 => 6 + (experience - 500) / 500,
      < 2000 => 7 + (experience - 1000) / 1000,
      < 3500 => 8 + (experience - 2000) / 1500,
      < 6000 => 9 + (experience - 3500) / 2500,
      < 10000 => 10 + (experience - 6000) / 4000,
      < 15000 => 11 + (experience - 10000) / 5000,
      _ => 12 + (experience - 15000) / 10000,
    };
  }
}

class SkywarsModeStats {
  final int kills;
  final int deaths;

  final int wins;
  final int losses;

  const SkywarsModeStats({
    this.kills = 0,
    this.deaths = 0,
    this.wins = 0,
    this.losses = 0,
  });

  double get kdRatio {
    return kills / deaths;
  }

  double get wlRatio {
    return wins / losses;
  }
}
