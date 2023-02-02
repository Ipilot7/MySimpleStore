import 'package:flutter/material.dart';

class SelectSizeWidget extends StatelessWidget {
  const SelectSizeWidget({
    Key? key,
    required this.selected,
    required this.text,
  }) : super(key: key);
  final bool selected;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
          color: selected ? Colors.blue : Colors.white),
      child: Text(text),
    );
  }
}
