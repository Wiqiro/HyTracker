import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final String text;
  final void Function() callback;

  const EditButton({
    required this.text,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              'assets/edit.png',
              height: 26,
            ),
          ],
        ),
      ),
    );
  }
}
