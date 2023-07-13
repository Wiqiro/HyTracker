import 'package:flutter/material.dart';
import 'package:hytracker/providers/user.dart';
import 'package:provider/provider.dart';

import 'stats_gamemodes_screens/bedwars_stats_screen.dart';
import 'stats_gamemodes_screens/skywars_stats_screen.dart';
import '../models/player.dart';
import '../utils/hypixel_api_wrapper.dart';
import '../widgets/formatted_username.dart';
import '../widgets/search_bar.dart';
import '../widgets/gamemode_card.dart';
import '../widgets/profile_options.dart';

class StatsMenuScreen extends StatefulWidget {
  static const String routeName = '/stats-screen';

  const StatsMenuScreen({super.key});

  @override
  State<StatsMenuScreen> createState() => _StatsMenuScreenState();
}

class _StatsMenuScreenState extends State<StatsMenuScreen> {
  Future<void> _searchPlayerCallback(String input, bool replace) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      var newPlayerUuidData = await HttpRequests().getUuidFromUsername(input);
      var newPlayerUuid = newPlayerUuidData['id'];

      if (context.mounted) {
        var newPlayerData = await HttpRequests().getHypixelPlayerData(
          Provider.of<UserProvider>(context, listen: false).apiKey,
          newPlayerUuid,
        );
        Player newPlayer = Player.fromRawData(
          username: newPlayerUuidData['name'],
          data: newPlayerData,
        );

        if (context.mounted) {
          Navigator.of(context).pop();
          replace
              ? Navigator.of(context).pushNamed(StatsMenuScreen.routeName, arguments: newPlayer)
              : Navigator.of(context).popAndPushNamed(StatsMenuScreen.routeName, arguments: newPlayer);
        }
      }
    } catch (error) {
      if (context.mounted) Navigator.of(context).pop();
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Player player = ModalRoute.of(context)?.settings.arguments as Player;
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
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormattedUsername(text: player.formattedUsername, fontSize: 20),
              CustomSearchBar(
                hint: 'Enter player name',
                callback: (input) => _searchPlayerCallback(
                  input,
                  (Provider.of<UserProvider>(context, listen: false).player.username.toLowerCase() == player.username.toLowerCase()),
                ),
              ),
              GamemodeCard(
                title: 'Bedwars',
                image: 'assets/images/bedwars.png',
                callback: () => Navigator.of(context).pushNamed(BedwarsStatsScreen.routeName, arguments: player),
                text: player.bedwarsStats.getSummarisedString,
              ),
              GamemodeCard(
                title: 'Skywars',
                image: 'assets/images/skywars.png',
                callback: () => Navigator.of(context).pushNamed(SkywarsStatsScreen.routeName, arguments: player),
                text: player.skywarsStats.getSummarisedString,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
