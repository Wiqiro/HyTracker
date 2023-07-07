import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hint;
  final void Function(String input) callback;

  CustomSearchBar({
    required this.hint,
    required this.callback,
    super.key,
  });

  var _input = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              onChanged: (value) {
                _input = value;
              },
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            callback(_input);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Center(
              child: Image.asset(
                'assets/search.png',
                height: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
