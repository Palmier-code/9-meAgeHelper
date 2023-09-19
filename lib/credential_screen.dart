import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            "Je suis fervent pour prendre toutes vos remarqueou correction concernant cette application",
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
            "App Version: alpha 1.3.0",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            "Changement pour cette version: \n-Ajout de la page armée\n-Ajout du stockage de l'armée\n-Ajout du début des calculs de fin de partie\n-Ajout du alcul des points de vos armées",
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

  Future<void> _lunchLinkedin() async {
    if (!await launchUrl(
      Uri.parse("www.linkedin.com/in/charlesaffouard"),
    )) {
      throw Exception('Could not launch Linekdin');
    }
    ;
  }

  Future<void> _lunchDiscord() async {
    if (!await launchUrl(
      Uri.parse("www.linkedin.com/in/charlesaffouard"),
    )) {
      throw Exception('Could not launch Linekdin');
    }
    ;
  }
}
