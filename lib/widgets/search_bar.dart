import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String hint;
  final void Function(String input) callback;
  final int maxLength;

  const CustomSearchBar({
    required this.hint,
    required this.callback,
    this.maxLength = 16,
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  var _input = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: widget.hint,
              border: InputBorder.none,
              counterText: '',
            ),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
            onChanged: (value) {
              _input = value;
            },
            onSubmitted: (value) => widget.callback(value.trim()),
            maxLength: widget.maxLength,
          ),
          GestureDetector(
            onTap: () {
              widget.callback(_input.trim());
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: Image.asset(
                  'assets/images/search.png',
                  height: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
