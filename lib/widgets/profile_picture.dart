import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.memory(
          Provider.of<UserProvider>(context).avatar!,
          scale: 0.01,
          filterQuality: FilterQuality.none,
        ),
      ),
    );
  }
}
