import 'package:flutter/material.dart';
import 'package:hytracker/providers/user.dart';
import 'package:hytracker/screens/stats_gamemodes_screens/duels_stats_screen.dart';
import 'package:provider/provider.dart';

import 'stats_gamemodes_screens/bedwars_stats_screen.dart';
import 'stats_gamemodes_screens/skywars_stats_screen.dart';
import '../models/player.dart';
import '../utils/hypixel_api_wrapper.dart';
import '../widgets/minecraft_text.dart';
import '../widgets/search_bar.dart';
import '../widgets/gamemode_card.dart';
import '../widgets/profile_options.dart';

class StatsMenuScreen extends StatefulWidget {
  final Player player;

  const StatsMenuScreen(this.player, {super.key});

  @override
  State<StatsMenuScreen> createState() => _StatsMenuScreenState();
}

class _StatsMenuScreenState extends State<StatsMenuScreen> {
  Future<void> _searchPlayerCallback(String input) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      Map<String, dynamic> newPlayerUuidData = await HttpRequests().getUuidFromUsername(input);

      if (!mounted) return;

      Map<String, dynamic> newPlayerData = await HttpRequests().getHypixelPlayerData(
        Provider.of<UserProvider>(context, listen: false).apiKey,
        newPlayerUuidData['id'],
      );

      Player newPlayer = Player.fromRawData(
        username: newPlayerUuidData['name'],
        data: newPlayerData,
      );

      if (!mounted) return;
      Navigator.of(context, rootNavigator: true).pop();
      String loggedUsername = Provider.of<UserProvider>(context, listen: false).player.username;
      MaterialPageRoute<dynamic> route = MaterialPageRoute(
        builder: (context) => StatsMenuScreen(newPlayer),
      );

      if (loggedUsername.toLowerCase() == widget.player.username.toLowerCase() &&
          input.toLowerCase() != widget.player.username.toLowerCase() &&
          input.toLowerCase() != loggedUsername.toLowerCase()) {
        Navigator.of(context).push(route);
      } else {
        Navigator.of(context).pushReplacement(route);
      }
    } catch (error) {
      if (mounted) Navigator.of(context).pop();
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player stats'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MinecraftText(widget.player.formattedUsername, fontSize: 20, fontFamily: 'Minecraftia'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomSearchBar(
                  hint: 'Enter player name',
                  callback: (input) => _searchPlayerCallback(input),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '''
Level: ${widget.player.level.toStringAsFixed(2)}
Karma: ${widget.player.karma}''',
                ),
              ),
              GamemodeCard(
                title: 'Bedwars',
                image: 'assets/images/bedwars.png',
                callback: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BedwarsStatsScreen(widget.player),
                    ),
                  );
                },
                text: '''
Level: ${widget.player.bedwarsStats.level.toStringAsFixed(2)}
Wins: ${widget.player.bedwarsStats.overall.wins}
Final kills: ${widget.player.bedwarsStats.overall.finalKills}
Beds broken: ${widget.player.bedwarsStats.overall.bedsBroken}''',
              ),
              GamemodeCard(
                title: 'Skywars',
                image: 'assets/images/skywars.png',
                callback: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SkywarsStatsScreen(widget.player),
                    ),
                  );
                },
                text: '''
Level: ${widget.player.skywarsStats.level.toStringAsFixed(2)}
Wins: ${widget.player.skywarsStats.overall.wins}
Losses: ${widget.player.skywarsStats.overall.losses}
''',
              ),
              GamemodeCard(
                title: 'Duels',
                image: 'assets/images/duels.png',
                callback: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DuelsStatsScreen(widget.player),
                    ),
                  );
                },
                text: '''
Wins: ${widget.player.duelsStats.overall.wins}
Losses: ${widget.player.duelsStats.overall.losses}
Kills: ${widget.player.duelsStats.overall.kills}
''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
