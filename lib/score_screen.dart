import 'package:flutter/material.dart';

class ScoreScren extends StatefulWidget {
  const ScoreScren({Key? key}) : super(key: key);

  @override
  State<ScoreScren> createState() => _ScoreScrennState();
}

class _ScoreScrennState extends State<ScoreScren> {
  TextEditingController army1 = TextEditingController();
  TextEditingController army2 = TextEditingController();
  bool man1 = false;
  bool man2 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: army1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Vos points',
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: TextField(
                  controller: army2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Les points adverses',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text("Objectif secondaire"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: man1,
                onChanged: ((value) {
                  man1 = true;
                  man2 = false;
                }),
              ),
              Checkbox(
                value: man2,
                onChanged: ((value) {
                  man2 = true;
                  man1 = false;
                }),
              ),
            ],
          ),
          const Text("Calculer le score"),
        ],
      ),
    );
  }
}
