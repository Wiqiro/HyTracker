import 'package:hytracker/models/stat_record.dart';

class BedwarsStatRecord extends StatRecord {
  BedwarsStatRecord.fromRawData(Map<String, dynamic> rawData) {
    var bedwarsRawData = rawData['player']['stats']['Bedwars'];
    Map<String, dynamic> data = {
      //'level': _level(bedwarsRawData['Experience']),
      'experience': bedwarsRawData['Experience'],
      'prestige': null,
      'coins': null,
      'lootChests': null,
      'overall': {
        //kills
        'kills': bedwarsRawData['kills_bedwars'],
        'deaths': null,
        'kdRatio': null,
        //finals
        'fkills': null,
        'fdeaths': null,
        'fkdRatio': null,
        //wins
        'wins': null,
        'losses': null,
        'wlRatio': null,
        'winstreak': null,
        //beds
        'bedsBroken': null,
        'bedsLost': null,
        'bblRatio': null,
      }
    };
    super.data = data;
  }

  @override
  String get getSummarisedString {
    return '''
Level: ${data['overall']['level']}
Wins: ${data['overall']['wins']}
Losses: ${data['overall']['losses']}
Final kills: ${data['overall']['fkills']}
Beds broken: ${data['overall']['bedsBroken']}''';
  }

  double _level(double exp) {
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
}
