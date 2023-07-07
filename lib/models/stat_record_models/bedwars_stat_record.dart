import 'package:hytracker/models/stat_record.dart';

class BedwarsStatRecord extends StatRecord {
  BedwarsStatRecord.fromRawData(Map<String, dynamic> rawData) {
    var bedwarsRawData = rawData['player']['stats']['Bedwars'];
    Map<String, dynamic> data = {
      'level': null,
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
}
