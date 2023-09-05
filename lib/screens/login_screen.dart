import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hytracker/screens/navigation_screen.dart';
import 'package:hytracker/screens/stats_menu_screen.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';
import '../widgets/edit_button.dart';
import '../widgets/minecraft_text.dart';
import '../widgets/main_button.dart';
import '../widgets/search_bar.dart';
import '../widgets/profile_picture.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _uuidInputCallback(BuildContext context, String username) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await Provider.of<UserProvider>(context, listen: false).setMcUserData(username);
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    } finally {
      if (context.mounted) Navigator.of(context).pop();
    }
  }

  Future<void> _apiKeyInputCallback(BuildContext context, String key) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      await Provider.of<UserProvider>(context, listen: false).setHypixelUserData(key);
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    } finally {
      if (context.mounted) Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
    Provider.of<UserProvider>(context, listen: false).tryAutoLogin().then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NavigationScreen(),
        ),
      );
    }).catchError((error) {
      Navigator.of(context).pop();
      //if (error.toString().compareTo('No previous login') != 0) {
      Fluttertoast.showToast(msg: error.toString());
      //}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: !Provider.of<UserProvider>(context).isUuidSet
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      ? MinecraftText(
                          Provider.of<UserProvider>(context).player.formattedUsername,
                          fontSize: 26,
                          fontFamily: 'Minecraftia',
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
                          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          child: CustomSearchBar(
                            hint: ' API Key',
                            callback: (input) => _apiKeyInputCallback(context, input),
                            maxLength: 36,
                          ),
                        ),
                  const SizedBox(height: 20),
                  Provider.of<UserProvider>(context).isApiSet
                      ? MainButton(
                          text: 'Save',
                          callback: () {
                            Provider.of<UserProvider>(context, listen: false).saveUserData();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const NavigationScreen(),
                              ),
                            );
                          },
                        )
                      : const SizedBox(height: 60),
                ],
              ),
      ),
    );
  }
}
