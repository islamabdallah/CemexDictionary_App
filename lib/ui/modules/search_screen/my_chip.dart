import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final String label;
  const MyChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.transparent,
      side: BorderSide(color: Color(0x2624272C)),
    );
  }
}
