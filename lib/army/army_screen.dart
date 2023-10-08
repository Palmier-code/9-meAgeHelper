import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palmhelp/Utils/pop_up.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DisplayArmy(army: _army),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _addNewArmy,
            tooltip: 'Ajouter une liste',
            backgroundColor: Colors.grey[800],
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 6,
          ),
          FloatingActionButton(
            onPressed: () => popUp(
                context: context,
                string:
                    "1. Vous devez faire votre liste sur New Recruit\n2. Vous devez export votre liste sous format text\n3. Copier ce texte\n4. Cliquez sur le bouton + et ça marche!!\n\n\nLorsque vous cliquez sur un élément de votre liste le points se calcul automatiquement ;)",
                title: "Besoin d'aide ?",
                ),
            tooltip: 'Comment ça marche ?',
            backgroundColor: Colors.grey[800],
            child: const Icon(Icons.help),
          ),
        ],
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

  void testArmy() async {
    final prefs = await SharedPreferences.getInstance();
    String copiedtext =
        "Dwarven Holds\n765 - King, General, War Throne,  Hand Weapon (Rune of Destruction, Rune of Fury, Rune of Craftsmanship), 3x Rune of Shielding, Holdstone, Battle Rune\n405 - Runic Smith, Shield, Rune of Retribution, Rune of Denial, Rune of Harnessing, Rune of Shielding, 3x Battle Rune\n355 - Thane, Shield, Battle Standard Bearer (Runic Standard of Swiftness, Flaming Standard), Rune of Shielding, Rune of Mining, Battle Rune\n640 - 30 Greybeards, Shield, Standard Bearer (Banner of Speed), Musician, Champion\n520 - 30 Clan Warriors, Spear and Shield, Vanguard, Standard Bearer (Runic Standard of the Hold), Musician, Champion\n595 - 30 Deep Watch, Standard Bearer (Banner of Speed), Musician, Champion\n590 - 25 Seekers, Vanguard, Musician\n315 - 15 Miners, Great Weapon, Paired Weapons, Throwing Weapons, Musician\n315 - 15 Miners, Great Weapon, Paired Weapons, Throwing Weapons, Musician\n4500\n";
    setState(() {
      _army = (copiedtext);
      prefs.setString('army', _army);
    });
  }
}
