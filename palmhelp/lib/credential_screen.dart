import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CredentialScreen extends StatefulWidget {
  CredentialScreen({Key? key}) : super(key: key);

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
            "Je suis fervent pour prendre toutes vos remarqueou correction concernant cette application",
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
            child: const Text(
              "Linkedin (pour les professionels)",
              style: TextStyle(fontSize: 18),
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
