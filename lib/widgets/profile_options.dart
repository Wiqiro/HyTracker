import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 44,
      height: 44,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Image.memory(
          Provider.of<UserProvider>(context).avatar!,
          scale: 0.01,
          filterQuality: FilterQuality.none,
        ),
      ),
    );
  }
}
