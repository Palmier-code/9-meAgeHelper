import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class CredentialScreen extends StatefulWidget {
  const CredentialScreen({Key? key}) : super(key: key);

  @override
  State<CredentialScreen> createState() => _CredentialScreenState();
}

class _CredentialScreenState extends State<CredentialScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bienvenue sur l'application PalmHelp",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Elle à été developper par Charles Affouard connu sous le pseudo Durgrim",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Je suis fervent pour prendre toutes vos remarque ou correction concernant cette application",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Pour me contacter mon discord est:",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            "Palmier#3981",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "App Version: BETA v1.0.8",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            "Changement pour cette version:\n-Ajout du général et de la grande banière pour le calcul du score\n-Revus de l'UI/UX de l'application\n-Affichage des erreurs sur la page points\n-Ajout du book résumée\n-Reformation des WoDG pour la page des choix de book\n-Mise en place de la page aide\n-Revus de la popup",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          )
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
          // const SizedBox(
          //   height: 12,
          // ),
          // InkWell(
          //   onTap: () => _lunchLinkedin(),
          //   child: const Text(
          //     "Linkedin (pour les professionels)",
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Future<void> _lunchLinkedin() async {
  //   if (!await launchUrl(
  //     Uri.parse("www.linkedin.com/in/charlesaffouard"),
  //   )) {
  //     throw Exception('Could not launch Linekdin');
  //   }
  // }

  // Future<void> _lunchDiscord() async {
  //   if (!await launchUrl(
  //     Uri.parse("www.linkedin.com/in/charlesaffouard"),
  //   )) {
  //     throw Exception('Could not launch Linekdin');
  //   }
  // }
}
