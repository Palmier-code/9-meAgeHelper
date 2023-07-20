import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palmhelp/army/display_army.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArmyScreen extends StatefulWidget {
  const ArmyScreen({Key? key}) : super(key: key);

  @override
  State<ArmyScreen> createState() => _ArmyScreenState();
}

class _ArmyScreenState extends State<ArmyScreen> {
  String _army = "Pas d'armée";

  @override
  void initState() {
    super.initState();
    _loadArmy();
    // removearmy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            DisplayArmy(army: _army),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewArmy,
        tooltip: 'Ajouter une liste',
        backgroundColor: Colors.grey[800],
        child: const Icon(Icons.add),
      ),
    );
  }

  void _loadArmy() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _army = (prefs.getString('army') ?? "Pas d'armée");
    });
  }

  void removearmy() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('army');
    setState(() {
      _army = "Pas d'armée remove";
    });
  }

  void _addNewArmy() async {
    final prefs = await SharedPreferences.getInstance();
    final ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
    String copiedtext = cdata!.text ?? "No army";
    setState(() {
      _army = (copiedtext);
      prefs.setString('army', _army);
    });
  }
}
