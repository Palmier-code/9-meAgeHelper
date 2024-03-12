import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DisplayArmy extends StatefulWidget {
  const DisplayArmy({Key? key, required this.army}) : super(key: key);

  final String army;

  @override
  State<DisplayArmy> createState() => _DisplayArmyState();
}

class _DisplayArmyState extends State<DisplayArmy> {
  int total = 0;

  late ValueNotifier<List<int>> widgetsListsCheck;

  @override
  void initState() {
    super.initState();
    widgetsListsCheck = ValueNotifier(List.generate(22, (index) => 0));
  }

  @override
  Widget build(BuildContext context) {
    List<String> armySplit = widget.army.split('\n');
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: armySplit.length,
      itemBuilder: (BuildContext context, int index) {
        return armyContainer(
          armySplit[index],
          index,
          armySplit.length,
          widgetsListsCheck.value[index],
        );
      },
    );
  }

  Widget armyContainer(String unity, int index, int max, int widgetValue) {
    int tmpIsEven = 0;

    if (index == 0) {
      return _titleArmy(unity);
    } else if (index == max - 1) {
      return totalPoint(total);
    }

    if (int.parse(unity.substring(0, 3)) % 2 == 1) {
      tmpIsEven = 1;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(unity),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _skullIcon(
                    () {
                      setState(() {
                        switch (widgetValue) {
                          case 0:
                            break;
                          case 1:
                            total -= int.parse(unity.substring(0, 3)) ~/ 2 +
                                tmpIsEven;
                            break;
                          case 2:
                            total -= int.parse(unity.substring(0, 3));
                            break;
                          default:
                        }
                        widgetsListsCheck.value[index] = 0;
                      });
                    },
                    index,
                    PhosphorIcons.skull(),
                    0,
                  ),
                  _skullIcon(
                    () {
                      setState(() {
                        switch (widgetValue) {
                          case 0:
                            total += int.parse(unity.substring(0, 3)) ~/ 2 +
                                tmpIsEven;
                            break;
                          case 1:
                            break;
                          case 2:
                            total -= int.parse(unity.substring(0, 3)) ~/ 2;
                            break;
                          default:
                        }
                        widgetsListsCheck.value[index] = 1;
                      });
                    },
                    index,
                    PhosphorIconsBold.skull,
                    1,
                  ),
                  _skullIcon(
                    () {
                      setState(() {
                        switch (widgetValue) {
                          case 0:
                            total += int.parse(unity.substring(0, 3));
                            break;
                          case 1:
                            total += int.parse(unity.substring(0, 3)) ~/ 2;
                            break;
                          case 2:
                            break;
                          default:
                        }
                        widgetsListsCheck.value[index] = 2;
                      });
                    },
                    index,
                    PhosphorIconsFill.skull,
                    2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget totalPoint(int total) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Total des points perdu : $total",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 120,
        ),
      ],
    );
  }

  Widget _titleArmy(String unity) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          unity,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _skullIcon(
      Function() onCliqued, int index, PhosphorIconData icon, int place) {
    return InkWell(
      onTap: onCliqued,
      child: Container(
        decoration: BoxDecoration(
          color: widgetsListsCheck.value[index] == place
              ? Colors.grey[800]
              : Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: PhosphorIcon(
            icon,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
