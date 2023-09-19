import 'package:flutter/material.dart';

class DisplayArmy extends StatefulWidget {
  const DisplayArmy({Key? key, required this.army}) : super(key: key);

  final String army;

  @override
  State<DisplayArmy> createState() => _DisplayArmyState();
}

class _DisplayArmyState extends State<DisplayArmy> {
  int total = 0;
  late ValueNotifier<List<bool>> widgetListCheck;

  @override
  void initState() {
    super.initState();
    widgetListCheck = ValueNotifier(List.generate(20, (index) => false));
  }

  @override
  Widget build(BuildContext context) {
    List<String> armySplit = widget.army.split('\n');
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: armySplit.length,
      itemBuilder: (BuildContext context, int index) {
        return armyContainer(
          armySplit[index],
          index,
          armySplit.length,
          widgetListCheck.value[index],
        );
      },
    );
  }

  Widget armyContainer(String unity, int index, int max, bool widgetCheck) {
    // TextDecoration tmp = widgetListCheck.value[index] == false
    //     ? TextDecoration.none
    //     : TextDecoration.lineThrough;

    if (index == 0) {
      return Center(
        child: Text(
          unity,
        ),
      );
    } else if (index == max - 1) {
      return totalPoint(total);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.black.withOpacity(0.8),
        child: Text(
          unity,
          style: TextStyle(
            decoration: widgetListCheck.value[index] == false
                ? TextDecoration.none
                : TextDecoration.lineThrough,
          ),
        ),
        onTap: () {
          setState(() {
            print(widgetListCheck.value[index]);
            widgetListCheck.value[index] = !widgetListCheck.value[index];
            print(widgetListCheck.value[index]);
            total = widgetListCheck.value[index]
                ? total + int.parse(unity.substring(0, 3))
                : total - int.parse(unity.substring(0, 3));
          });
        },
      ),
    );
  }

  Widget totalPoint(int total) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Total points perdu: $total"),
    );
  }
}

// class ButtonA extends StatefulWidget {
//   VoidCallback tap;
//   Color defaultColor;
//   Color pressedColor;
//   ButtonA(
//       {required this.tap,
//       required this.pressedColor,
//       required this.defaultColor});

//   @override
//   State createState() => new ButtonAState();
// }

// class ButtonAState extends State<ButtonA> {
//   bool _pressed = false;
//   Widget build(BuildContext context) {
//     return new Expanded(
//       child: new Material(
//         color: _pressed ? widget.pressedColor : widget.defaultColor,
//         child: new InkWell(
//           onTap: () {
//             widget.tap();
//             this.setState(() {
//               _pressed = true;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
