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
    List<String> armySplit = widget.army.split('\n');
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: armySplit.length,
      itemBuilder: (BuildContext context, int index) {
        return armyContainer(armySplit[index], index, armySplit.length);
      },
    );
  }

  Widget armyContainer(String unity, int index, int max) {
    if (index == 0 || index == max) {
      return Center(
        child: Text(
          unity,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Text(unity),
        onTap: () {},
      ),
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
