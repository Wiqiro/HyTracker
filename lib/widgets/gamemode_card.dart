import 'package:flutter/material.dart';
import 'package:hytracker/models/stat_record.dart';

class GamemodeCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String onTapRoute;
  final StatRecord stats;

  const GamemodeCard({
    required this.title,
    required this.imagePath,
    required this.onTapRoute,
    required this.stats,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          Navigator.of(context).pushNamed(onTapRoute, arguments: stats);
        },
        child: Container(
          width: 400,
          height: 220,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  stats.getSummarisedString,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    shadows: [Shadow(offset: Offset(1, 1), blurRadius: 5)],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    shadows: [Shadow(offset: Offset(1, 1), blurRadius: 15)],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
