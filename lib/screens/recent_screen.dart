import 'package:flutter/material.dart';
import 'package:hytracker/providers/sessions.dart';
import 'package:provider/provider.dart';

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
      body: Column(
          children: Provider.of<SessionsProvider>(context)
              .sessions
              .map((e) => Text('Session from ${e.startTime} to ${e.endTime}'))
              .toList()),
    );
  }
}
