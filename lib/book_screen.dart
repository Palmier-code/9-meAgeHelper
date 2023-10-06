import 'package:flutter/material.dart';
import 'package:palmhelp/pdfGesture/button_show_book.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final ScrollController _scrollBarController = ScrollController();
  late String version = "francais";
  bool switchVersion = true;
  late String versionBook = "Septembre 2023";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Scrollbar(
        controller: _scrollBarController,
        thumbVisibility: true,
        child: ListView(
          controller: _scrollBarController,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Les livres de règles",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Text("Version: "),
                          Text(version == "francais" ? "FR" : "EN"),
                          Switch(
                            activeColor: Colors.grey[900],
                            value: switchVersion,
                            onChanged: (bool value) {
                              setState(
                                () {
                                  switchVersion = value;
                                  if (switchVersion == true) {
                                    version = "francais";
                                  } else {
                                    version = "englais";
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text("Version: $versionBook"),
                Wrap(
                  children: [
                    buttonShowBook(
                        context, version, "Regles", version == "francais" ? "Livre de Regles" : "RulesBook"),
                    buttonShowBook(
                        context, version, "Magie", version == "francais" ? "Recueil Arcanique" : "Arcane Compendium"),
                    buttonShowBook(context, version, "Resume", version == "francais" ? "Résumés" : "Summaries"),
                    buttonShowBook(
                        context, version, "Saurien", version == "francais" ? "Ancien Saurien" : "Saurian Ancients"),
                    buttonShowBook(
                        context, version, "Vampire", version == "francais" ? "Conclave Vampirique" : "Vampire Covenant"),
                    buttonShowBook(context, version, "ElfeNoire", version == "francais" ? "Elfes Noires" : "Dread Elves"),
                    buttonShowBook(
                        context, version, "ElfeSylvain", version == "francais" ? "Elfe Sylvain" : "Sylvan Elves"),
                    buttonShowBook(context, version, "ElfeHaut", version == "francais" ? "Haut Elfe" : "Highborn Elves"),
                    buttonShowBook(
                        context, version, "Empire", version == "francais" ? "Empire de Sonnstahl" : "Empire of Sonnstahl"),
                    buttonShowBook(
                        context, version, "Nain", version == "francais" ? "Forteresse Naines" : "Dwarven Holds"),
                    buttonShowBook(context, version, "Guerrier",version == "francais" ? 
                        "Guerrier des dieux sombres" : "Warriors of the Dark Gods"),
                    buttonShowBook(
                        context, version, "Bete", version == "francais" ? "Hardes bestiales" : "Beast Herds"),
                    buttonShowBook(
                        context, version, "Sphynx", version == "francais" ? "Dynastie immortels" : "Undying Dynasties"),
                    buttonShowBook(context, version, "Ogres", version == "francais" ? "Khan ogre" : "Ogre Khans"),
                    buttonShowBook(
                        context, version, "Demon", version == "francais" ? "Légion Démoniaque" : "Deamon Legions"),
                    buttonShowBook(
                        context, version, "Vermine", version == "francais" ? "Marée de vermines" : "Vermin Swarm"),
                    buttonShowBook(
                        context, version, "NainDuc", version == "francais" ? "Nain infernal" : "Infernal Dwarves"),
                    buttonShowBook(context, version, "Ork", version == "francais" ? "Orques et goblins" : "Orcs and Gobelins"),
                    buttonShowBook(
                        context, version, "Bretonnie", version == "francais" ? "Royaume d'Equitaine": "Kingdom of Equitaine"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
