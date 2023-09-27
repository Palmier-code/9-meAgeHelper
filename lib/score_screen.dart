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
  bool bsb1 = false;
  bool bsb2 = false;
  bool gen1 = false;
  bool gen2 = false;
  int score1 = 0;
  int score2 = 0;
  int total = 0;

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
                activeColor: Colors.grey[800],
                value: man1,
                onChanged: (value) {
                  setState(() {
                    man1 = value!;
                    man2 = false;
                  });
                },
              ),
              Checkbox(
                activeColor: Colors.grey[800],
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
          const Text("Grande banière"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                activeColor: Colors.grey[800],
                value: bsb1,
                onChanged: (value) {
                  setState(() {
                    bsb1 = value!;
                  });
                },
              ),
              Checkbox(
                activeColor: Colors.grey[800],
                value: bsb2,
                onChanged: (value) {
                  setState(() {
                    bsb2 = value!;
                  });
                },
              ),
            ],
          ),
          const Text("Général"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                activeColor: Colors.grey[800],
                value: gen1,
                onChanged: (value) {
                  setState(() {
                    gen1 = value!;
                  });
                },
              ),
              Checkbox(
                activeColor: Colors.grey[800],
                value: gen2,
                onChanged: (value) {
                  setState(() {
                    gen2 = value!;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[800],
            ),
            child: const Text(
              "Calculer le score",
            ),
            onPressed: () {
              if (int.tryParse(army1.text) != null &&
                  int.tryParse(army2.text) != null) {
                int tmp = int.parse(army1.text) - int.parse(army2.text);
                if (bsb1 == true) {
                  tmp = tmp + 200;
                }
                if (bsb2 == true) {
                  tmp = tmp - 200;
                }
                if (gen1 == true) {
                  tmp = tmp + 200;
                }
                if (gen2 == true) {
                  tmp = tmp - 200;
                }
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
                  total = tmp;
                });
              } else {
                print("Do nothing"); // TODO mettre une popup
              }
            },
          ),
          Text("$score1-$score2"),
          // Text(total.toString()),
        ],
      ),
    );
  }
}
