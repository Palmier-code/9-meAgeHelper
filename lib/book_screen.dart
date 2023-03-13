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
                buttonShowBook(context, version, "Regles", "Livre de Regles"),
                buttonShowBook(context, version, "Magie", "Recueil Arcanique"),
                buttonShowBook(context, version, "Saurien", "Ancien Saurien"),
                buttonShowBook(context, version, "Vampire", "Compte Vampire"),
                buttonShowBook(context, version, "ElfeNoire", "Elfe Noire"),
                buttonShowBook(context, version, "ElfeSylvain", "Elfe Sylvain"),
                buttonShowBook(context, version, "ElfeHaut", "Haut Elfe"),
                buttonShowBook(
                    context, version, "Empire", "Empire de Sonnstahl"),
                buttonShowBook(context, version, "Nain", "Forteresse Naines"),
                buttonShowBook(
                    context, version, "Guerrier", "Guerrier des dieux sombres"),
                buttonShowBook(context, version, "Bete", "Hardes bestiales"),
                buttonShowBook(
                    context, version, "Sphynx", "Dynastie immortels"),
                buttonShowBook(context, version, "Ogres", "Khan ogre"),
                buttonShowBook(context, version, "Demon", "Légion Démoniaque"),
                buttonShowBook(
                    context, version, "Vermine", "Marée de vermines"),
                buttonShowBook(context, version, "NainDuc", "Nain infernal"),
                buttonShowBook(context, version, "Ork", "Orque et goblin"),
                buttonShowBook(
                    context, version, "Bretonnie", "Royaume d'Equitaine"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
