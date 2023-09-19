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
  int score1 = 0;
  int score2 = 0;

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
                onChanged: (value) {
                  setState(() {
                    man1 = value!;
                    man2 = false;
                  });
                },
              ),
              Checkbox(
                value: man2,
                onChanged: (value) {
                  setState(() {
                    man2 = value!;
                    man1 = false;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            child: Text("Calculer le score"),
            onPressed: () {
              if (int.tryParse(army1.text) != null &&
                  int.tryParse(army2.text) != null) {
                int tmp = int.parse(army1.text) - int.parse(army2.text);
                setState(() {
                  if (255 >= tmp && tmp >= -255) {
                    score1 = 10;
                    score2 = 10;
                  } else if (450 >= tmp && tmp >= 226) {
                    score1 = 11;
                    score2 = 9;
                  } else if (900 >= tmp && tmp >= 451) {
                    score1 = 12;
                    score2 = 8;
                  } else if (1350 >= tmp && tmp >= 901) {
                    score1 = 13;
                    score2 = 7;
                  } else if (1800 >= tmp && tmp >= 1351) {
                    score1 = 14;
                    score2 = 6;
                  } else if (2250 >= tmp && tmp >= 1801) {
                    score1 = 15;
                    score2 = 5;
                  } else if (3150 >= tmp && tmp >= 2251) {
                    score1 = 16;
                    score2 = 4;
                  } else if (3150 < tmp) {
                    score1 = 17;
                    score2 = 3;
                    // --------------------------------------------------
                  } else if (-450 <= tmp && tmp <= -226) {
                    score1 = 9;
                    score2 = 11;
                  } else if (-900 <= tmp && tmp <= -451) {
                    score1 = 8;
                    score2 = 12;
                  } else if (-1350 <= tmp && tmp <= -901) {
                    score1 = 7;
                    score2 = 13;
                  } else if (-1800 <= tmp && tmp <= -1351) {
                    score1 = 6;
                    score2 = 14;
                  } else if (-2250 <= tmp && tmp >= -1801) {
                    score1 = 5;
                    score2 = 15;
                  } else if (-3150 <= tmp && tmp <= -2251) {
                    score1 = 4;
                    score2 = 16;
                  } else if (-3150 > tmp) {
                    score1 = 3;
                    score2 = 17;
                  }
                  if (man1) {
                    score1 += 3;
                    score2 -= 3;
                  } else if (man2) {
                    score1 -= 3;
                    score2 += 3;
                  }
                });
              } else {
                print("Do nothing"); // TODO mettre une popup
              }
            },
          ),
          Text("$score1-$score2"),
        ],
      ),
    );
  }
}