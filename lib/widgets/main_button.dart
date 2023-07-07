import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final void Function() callback;

  const MainButton({
    required this.text,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
