import 'package:hytracker/models/stat_record.dart';

class SkywarsStats extends StatRecord {
  late final int experience;
  late final double level;
  late final String prefix;

  late final int shards;
  late final int coins;
  late final int lootChests;

  late final SkywarsModeStats overall;
  late final SkywarsModeStats soloNormal;
  late final SkywarsModeStats soloInsane;
  late final SkywarsModeStats teamsNormal;
  late final SkywarsModeStats teamsInsane;

  SkywarsStats({
    this.experience = 0,
    this.level = 1,
    this.prefix = '§7[1⋆]',
    this.shards = 0,
    this.coins = 0,
    this.lootChests = 0,
    this.overall = const SkywarsModeStats(),
    this.soloNormal = const SkywarsModeStats(),
    this.teamsNormal = const SkywarsModeStats(),
    this.teamsInsane = const SkywarsModeStats(),
  });

  SkywarsStats.fromRawData(Map<String, dynamic> data) {
    experience = data.containsKey('skywars_experience') ? data['skywars_experience'].toInt() : 0;
    level = _level(experience);
    prefix = data.containsKey('selected_prestige_icon')
        ? _prefix(level.toInt(), data['selected_prestige_icon'])
        : _prefix(level.toInt(), '');

    overall = SkywarsModeStats(
      kills: data.containsKey('kills') ? data['kills'] : 0,
      deaths: data.containsKey('deaths') ? data['deaths'] : 0,
      kdRatio: 0,
      wins: data.containsKey('wins') ? data['wins'] : 0,
      losses: data.containsKey('losses') ? data['losses'] : 0,
      wlRatio: data.containsKey('wins') && data.containsKey('losses') && data['losses'] != 0
          ? data['wins'] / data['losses']
          : double.nan,
    );
  }

/*   String _prestigeIcon(String iconName) {
    return switch (iconName) {
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
    };
  } */

  String _prefix(int level, String iconName) {
    var lvlStr = level.toString();

    var icon = switch (iconName) {
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
    };
    return switch (level) {
      < 5 => '§7[$lvlStr$icon]',
      < 10 => '§f[$lvlStr$icon]',
      < 15 => '§6[$lvlStr$icon]',
      < 20 => '§b[$lvlStr$icon]',
      < 25 => '§2[$lvlStr$icon]',
      < 30 => '§3[$lvlStr$icon]',
      < 35 => '§4[$lvlStr$icon]',
      < 40 => '§d[$lvlStr$icon]',
      < 45 => '§9[$lvlStr$icon]',
      < 50 => '§5[$lvlStr$icon]',
      < 55 => '§c[§6${lvlStr[0]}§e${lvlStr[1]}§a$icon§b]',
      < 60 => '§7[§f$lvlStr$icon§7]',
      < 65 => '§4[§c$lvlStr$icon§4]',
      < 70 => '§c[§f$lvlStr$icon§c]',
      < 75 => '§e[§6$lvlStr$icon§e]',
      < 80 => '§f[§9$lvlStr$icon§f]',
      < 85 => '§f[§b$lvlStr$icon§f]',
      < 90 => '§f[§3$lvlStr$icon§f]',
      < 95 => '§a[§3$lvlStr$icon§a]',
      < 100 => '§c[§e$lvlStr$icon§c]',
      < 105 => '§9[§1$lvlStr$icon§9]',
      < 110 => '§6[§4$lvlStr$icon§6]',
      < 115 => '§1[§b$lvlStr$icon§1]',
      < 120 => '§8[§7$lvlStr$icon§8]',
      < 125 => '§d[§5$lvlStr$icon§d]',
      < 130 => '§f[§e$lvlStr$icon§f]',
      < 135 => '§c[§e$lvlStr$icon§c]',
      < 140 => '§6[§c$lvlStr$icon§6]',
      < 145 => '§a[§c$lvlStr$icon§a]',
      < 150 => '§a[§b$lvlStr$icon§a]',
      >= 150 => icon == 'ಠ_ಠ'
          ? '§c[§6${lvlStr[0]}§e${lvlStr[1]}§a${lvlStr[2]}§bಠ§d_§5ಠ§c]'
          : '§c[§6${lvlStr[0]}§e${lvlStr[1]}§a${lvlStr[2]}§b$icon§c]',
      _ => '§7[$lvlStr$icon]'
    };
  }

  @override
  String get getSummarisedString {
    return '''
Level: $level
Wins: ${overall.wins}
Losses: ${overall.losses}''';
  }

  double _level(int exp) {
    return switch (exp) {
      < 20 => 1 + (exp / 20),
      < 70 => 2 + (exp - 20) / 50,
      < 150 => 3 + (exp - 70) / 80,
      < 250 => 4 + (exp - 150) / 100,
      < 500 => 5 + (exp - 250) / 250,
      < 1000 => 6 + (exp - 500) / 500,
      < 2000 => 7 + (exp - 1000) / 1000,
      < 3500 => 8 + (exp - 2000) / 1500,
      < 6000 => 9 + (exp - 3500) / 2500,
      < 10000 => 10 + (exp - 6000) / 4000,
      < 15000 => 11 + (exp - 10000) / 5000,
      _ => 12 + (exp - 15000) / 10000,
    };
  }
}

class SkywarsModeStats {
  final int kills;
  final int deaths;
  final double kdRatio;

  final int wins;
  final int losses;
  final double wlRatio;

  const SkywarsModeStats({
    this.kills = 0,
    this.deaths = 0,
    this.kdRatio = 0,
    this.wins = 0,
    this.losses = 0,
    this.wlRatio = 0,
  });
}
