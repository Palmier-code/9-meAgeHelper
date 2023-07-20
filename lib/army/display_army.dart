import 'package:flutter/material.dart';

class DisplayArmy extends StatefulWidget {
  const DisplayArmy({Key? key, required this.army}) : super(key: key);

  final String army;

  @override
  State<DisplayArmy> createState() => _DisplayArmyState();
}

class _DisplayArmyState extends State<DisplayArmy> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(widget.army),
    );
  }
}
