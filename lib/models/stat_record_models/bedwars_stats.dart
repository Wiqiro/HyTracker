class BedwarsStats {
  final int experience;
  final int coins;

  final BedwarsModeStats overall;
  final BedwarsModeStats solo;
  final BedwarsModeStats doubles;
  final BedwarsModeStats threes;
  final BedwarsModeStats fours;

  const BedwarsStats({
    this.experience = 500,
    this.coins = 0,
    this.overall = const BedwarsModeStats(),
    this.solo = const BedwarsModeStats(),
    this.doubles = const BedwarsModeStats(),
    this.threes = const BedwarsModeStats(),
    this.fours = const BedwarsModeStats(),
  });

  factory BedwarsStats.fromRawData(Map<String, dynamic> data) {
    return BedwarsStats(
      experience: data['Experience']?.toInt() ?? 500,
      coins: data['coins'] ?? 0,
      overall: BedwarsModeStats(
        kills: data['kills_bedwars'] ?? 0,
        deaths: data['deaths_bedwars'] ?? 0,
        finalKills: data['final_kills_bedwars'] ?? 0,
        finalDeaths: data['final_deaths_bedwars'] ?? 0,
        wins: data['wins_bedwars'] ?? 0,
        losses: data['losses_bedwars'] ?? 0,
        bedsBroken: data['beds_broken_bedwars'] ?? 0,
        bedsLost: data['beds_lost_bedwars'] ?? 0,
      ),
      solo: BedwarsModeStats(
        kills: data['eight_one_kills_bedwars'] ?? 0,
        deaths: data['eight_one_deaths_bedwars'] ?? 0,
        finalKills: data['eight_one_final_kills_bedwars'] ?? 0,
        finalDeaths: data['eight_one_final_deaths_bedwars'] ?? 0,
        wins: data['eight_one_wins_bedwars'] ?? 0,
        losses: data['eight_one_losses_bedwars'] ?? 0,
        bedsBroken: data['eight_one_beds_broken_bedwars'] ?? 0,
        bedsLost: data['eight_one_beds_lost_bedwars'] ?? 0,
      ),
      doubles: BedwarsModeStats(
        kills: data['eight_two_kills_bedwars'] ?? 0,
        deaths: data['eight_two_deaths_bedwars'] ?? 0,
        finalKills: data['eight_two_final_kills_bedwars'] ?? 0,
        finalDeaths: data['eight_two_final_deaths_bedwars'] ?? 0,
        wins: data['eight_two_wins_bedwars'] ?? 0,
        losses: data['eight_two_losses_bedwars'] ?? 0,
        bedsBroken: data['eight_two_beds_broken_bedwars'] ?? 0,
        bedsLost: data['eight_two_beds_lost_bedwars'] ?? 0,
      ),
      threes: BedwarsModeStats(
        kills: data['four_three_kills_bedwars'] ?? 0,
        deaths: data['four_three_deaths_bedwars'] ?? 0,
        finalKills: data['four_three_final_kills_bedwars'] ?? 0,
        finalDeaths: data['four_three_final_deaths_bedwars'] ?? 0,
        wins: data['four_three_wins_bedwars'] ?? 0,
        losses: data['four_three_losses_bedwars'] ?? 0,
        bedsBroken: data['four_three_beds_broken_bedwars'] ?? 0,
        bedsLost: data['four_three_beds_lost_bedwars'] ?? 0,
      ),
      fours: BedwarsModeStats(
        kills: data['four_four_kills_bedwars'] ?? 0,
        deaths: data['four_four_deaths_bedwars'] ?? 0,
        finalKills: data['four_four_final_kills_bedwars'] ?? 0,
        finalDeaths: data['four_four_final_deaths_bedwars'] ?? 0,
        wins: data['four_four_wins_bedwars'] ?? 0,
        losses: data['four_four_losses_bedwars'] ?? 0,
        bedsBroken: data['four_four_beds_broken_bedwars'] ?? 0,
        bedsLost: data['four_four_beds_lost_bedwars'] ?? 0,
      ),
    );
  }

  factory BedwarsStats.fromJson(Map<String, dynamic> json) {
    return BedwarsStats(
      experience: json['experience'] ?? 500,
      coins: json['coins'] ?? 0,
      overall: BedwarsModeStats.fromJson(json['overall']),
      solo: BedwarsModeStats.fromJson(json['solo']),
      doubles: BedwarsModeStats.fromJson(json['doubles']),
      threes: BedwarsModeStats.fromJson(json['threes']),
      fours: BedwarsModeStats.fromJson(json['fours']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'experience': experience,
      'coins': coins,
      'overall': overall.toJson(),
      'solo': solo.toJson(),
      'doubles': doubles.toJson(),
      'threes': threes.toJson(),
      'fours': fours.toJson(),
    };
  }

  double get level {
    int exp = experience.toInt();
    int expAbovePrestige = exp - ((exp / 487000).floor() * 487000);
    int prestigeLevel = (exp / 487000).floor() * 100;

    return switch (expAbovePrestige) {
      >= 7000 => prestigeLevel + 4 + (expAbovePrestige - 7000) / 5000,
      >= 3500 => prestigeLevel + 3 + (expAbovePrestige - 3500) / 3500,
      >= 1500 => prestigeLevel + 2 + (expAbovePrestige - 1500) / 2000,
      >= 500 => prestigeLevel + 1 + (expAbovePrestige - 500) / 500,
      _ => prestigeLevel + expAbovePrestige / 500,
    };
  }

  String get prefix {
    var raw = level.floor().toString();

    return switch (level) {
      < 100 => '§7[$raw✫]',
      < 200 => '§f[$raw✫]',
      < 300 => '§6[$raw✫]',
      < 400 => '§b[$raw✫]',
      < 500 => '§2[$raw✫]',
      < 600 => '§3[$raw✫]',
      < 700 => '§4[$raw✫]',
      < 800 => '§d[$raw✫]',
      < 900 => '§9[$raw✫]',
      < 1000 => '§5[$raw✫]',
      < 1100 => '§c[§6${raw[0]}§e${raw[1]}§a${raw[2]}§b${raw[3]}§d✫§5]',
      < 1200 => '§7[§f$raw§7✪§7]',
      < 1300 => '§7[§e$raw§6✪§7]',
      < 1400 => '§7[§b$raw§3✪§7]',
      < 1500 => '§7[§a$raw§2✪§7]',
      < 1600 => '§7[§3$raw§9✪§7]',
      < 1700 => '§7[§c$raw§4✪§7]',
      < 1800 => '§7[§d$raw§5✪§7]',
      < 1900 => '§7[§9$raw§1✪§7]',
      < 2000 => '§7[§5$raw§8✪§7]',
      < 2100 => '§8[§7${raw[0]}§f${raw.substring(1, 3)}§7${raw[3]}✪§8]',
      < 2200 => '§f[${raw[0]}§e${raw.substring(1, 3)}§6${raw[3]}⚝]',
      < 2300 => '§6[${raw[0]}§f${raw.substring(1, 3)}§b${raw[3]}§3⚝]',
      < 2400 => '§5[${raw[0]}§d${raw.substring(1, 3)}§6${raw[3]}§e⚝]',
      < 2500 => '§b[${raw[0]}§f${raw.substring(1, 3)}§7${raw[3]}⚝§8]',
      < 2600 => '§f[${raw[0]}§a${raw.substring(1, 3)}§2${raw[3]}⚝]',
      < 2700 => '§4[${raw[0]}§c${raw.substring(1, 3)}§d${raw[3]}⚝§5]',
      < 2800 => '§e[${raw[0]}§f${raw.substring(1, 3)}§8${raw[3]}⚝]',
      < 2900 => '§a[${raw[0]}§2${raw.substring(1, 3)}§6${raw[3]}⚝§e]',
      < 3000 => '§b[${raw[0]}§3${raw.substring(1, 3)}§9${raw[3]}⚝§1]',
      >= 3000 => '§e[${raw[0]}§6${raw.substring(1, 3)}§c${raw[3]}⚝§4]',
      _ => '§7[$raw✫]'
    };
  }
}

class BedwarsModeStats {
  final int kills;
  final int deaths;

  final int finalKills;
  final int finalDeaths;

  final int wins;
  final int losses;
  final int winstreak;

  final int bedsBroken;
  final int bedsLost;

  const BedwarsModeStats({
    this.kills = 0,
    this.deaths = 0,
    this.finalKills = 0,
    this.finalDeaths = 0,
    this.wins = 0,
    this.losses = 0,
    this.winstreak = 0,
    this.bedsBroken = 0,
    this.bedsLost = 0,
  });

  factory BedwarsModeStats.fromJson(Map<String, dynamic> json) {
    return BedwarsModeStats(
      kills: json['kills'] ?? 0,
      deaths: json['deaths'] ?? 0,
      finalKills: json['finalKills'] ?? 0,
      finalDeaths: json['finalDeaths'] ?? 0,
      wins: json['wins'] ?? 0,
      losses: json['losses'] ?? 0,
      winstreak: json['winstreak'] ?? 0,
      bedsBroken: json['bedsBroken'] ?? 0,
      bedsLost: json['bedsLost'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kills': kills,
      'deaths': deaths,
      'finalKills': finalKills,
      'finalDeaths': finalDeaths,
      'wins': wins,
      'losses': losses,
      'winstreak': winstreak,
      'bedsBroken': bedsBroken,
      'bedsLost': bedsLost,
    };
  }

  double get kdRatio {
    return deaths == 0 ? kills.toDouble() : kills / deaths;
  }

  double get fkdRatio {
    return finalDeaths == 0 ? finalKills.toDouble() : finalKills / finalDeaths;
  }

  double get wlRatio {
    return losses == 0 ? wins.toDouble() : wins / losses;
  }

  double get bblRatio {
    return bedsLost == 0 ? bedsBroken.toDouble() : bedsBroken / bedsLost;
  }
}
