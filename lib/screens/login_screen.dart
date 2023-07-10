import 'package:flutter/material.dart';
import 'package:hytracker/screens/stats_menu_screen.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';
import '../utils/constants.dart';
import '../widgets/edit_button.dart';
import '../widgets/formatted_username.dart';
import '../widgets/main_button.dart';
import '../widgets/search_bar.dart';
import '../widgets/profile_picture.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _uuidInputCallback(BuildContext context, String username) async {
    try {
      await Provider.of<UserProvider>(context, listen: false).setMcUserData(username);
    } catch (error) {
      return;
    }
  }

  Future<void> _apiKeyInputCallback(BuildContext context, String key) async {
    try {
      await Provider.of<UserProvider>(context, listen: false).setHypixelUserData(key);
    } catch (error) {
      return;
    }
  }

  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUserData().then((value) {
      if (value) {
        Navigator.of(context).popAndPushNamed(
          StatsMenuScreen.routeName,
          arguments: Provider.of<UserProvider>(context, listen: false).player,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Container(
        child: Center(
          child: !Provider.of<UserProvider>(context).isUuidSet
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomSearchBar(
                    hint: 'Minecraft username',
                    callback: (input) => _uuidInputCallback(context, input),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProfilePicture(),
                    const SizedBox(height: 20),
                    Provider.of<UserProvider>(context).isApiSet
                        ? FormattedUsername(
                            player: Provider.of<UserProvider>(context).player,
                            fontSize: 26,
                          )
                        : Text(
                            Provider.of<UserProvider>(context).username,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                    const SizedBox(height: 60),
                    Provider.of<UserProvider>(context).isUuidSet
                        ? EditButton(
                            text: 'Change user',
                            callback: () {},
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: CustomSearchBar(
                              hint: 'Minecraft username',
                              callback: (input) => _uuidInputCallback(context, input),
                            ),
                          ),
                    const SizedBox(height: 20),
                    Provider.of<UserProvider>(context).isApiSet
                        ? EditButton(
                            text: 'Edit API Key',
                            callback: () {},
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                            child: CustomSearchBar(
                              hint: ' API Key',
                              callback: (input) => _apiKeyInputCallback(context, Constants.apiKey),
                            ),
                          ),
                    const SizedBox(height: 20),
                    Provider.of<UserProvider>(context).isApiSet
                        ? MainButton(
                            text: 'Save',
                            callback: () {
                              Provider.of<UserProvider>(context, listen: false).saveUserData();
                              Navigator.of(context).popAndPushNamed(
                                StatsMenuScreen.routeName,
                                arguments: Provider.of<UserProvider>(context, listen: false).player,
                              );
                            },
                          )
                        : const SizedBox(height: 60),
                  ],
                ),
        ),
      ),
    );
  }
}
