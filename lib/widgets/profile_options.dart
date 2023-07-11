import 'package:flutter/material.dart';
import 'package:hytracker/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<UserProvider>(context, listen: false).logout();
        Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 40,
        height: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Image.memory(
            Provider.of<UserProvider>(context).avatar!,
            scale: 0.01,
            filterQuality: FilterQuality.none,
          ),
        ),
      ),
    );
  }
}
