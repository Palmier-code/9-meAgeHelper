import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class CredentialScreen extends StatefulWidget {
  const CredentialScreen({Key? key}) : super(key: key);

  @override
  State<CredentialScreen> createState() => _CredentialScreenState();
}

class _CredentialScreenState extends State<CredentialScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Bienvenue sur l'application PalmHelp",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Elle à été developper par Charles Affouard connu sous le pseudo Durgrim",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Je suis fervent pour prendre toutes vos remarque ou correction concernant cette application",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Pour me contacter mon discord est:",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Palmier#3981",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "App Version: BETA v1.1.3",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Changement pour cette version:\n-Ajout du général et de la grande banière pour le calcul du score\n-Revus de l'UI/UX de l'application\n-Affichage des erreurs sur la page points\n-Ajout du book résumée\n-Reformation des WoDG pour la page des choix de book\n-Mise en place de la page aide\n-Revus de la popup\n-Ajout de plusieurs emplacements pour les armées\n-Changement des couleurs pour la selections des listes\n-Refonte du code des boutons\n-Ajout du linkedin",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          // const SizedBox(
          //   height: 12,
          // ),
          // InkWell(
          //   onTap: () => _lunchDiscord(),
          //   child: Row(
          //     children: const [
          //       Text(
          //         "Discord",
          //         style: TextStyle(fontSize: 18),
          //       ),
          //       SizedBox(width: 2),
          //       Icon(Icons.discord),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () => _lunchLinkedin(),
            child: const Row(
              children: [
                Icon(
                  FontAwesomeIcons.linkedin,
                  size: 100,
                ),
                Text(
                  "Linkedin",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _lunchLinkedin() async {
    if (!await launchUrl(
      Uri.parse("www.linkedin.com/in/charlesaffouard"),
    )) {
      throw Exception('Could not launch Linekdin');
    }
  }

  // Future<void> _lunchDiscord() async {
  //   if (!await launchUrl(
  //     Uri.parse("www.linkedin.com/in/charlesaffouard"),
  //   )) {
  //     throw Exception('Could not launch Linekdin');
  //   }
  // }
}
