import 'package:flutter/material.dart';

import '../widgets/profile_options.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session tracker'),
        actions: const [
          ProfileOptions(),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
