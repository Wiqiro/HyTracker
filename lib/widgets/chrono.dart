import 'dart:async';

import 'package:flutter/material.dart';

class Chrono extends StatefulWidget {
  final DateTime startTime;
  const Chrono(this.startTime, {super.key});

  @override
  State<Chrono> createState() => _ChronoState();
}

class _ChronoState extends State<Chrono> {
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
        if (_seconds >= 60) {
          _seconds = 0;
          _minutes++;
        }
        if (_minutes >= 60) {
          _seconds = 0;
          _minutes = 0;
          _hours++;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_hours.toString().padLeft(2, '0')}:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
    );
  }
}
