import 'package:flutter/material.dart';

import '../widgets/profile_options.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session history'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
