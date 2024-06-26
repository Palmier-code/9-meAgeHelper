import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CredentialScreen extends StatefulWidget {
  const CredentialScreen({Key? key}) : super(key: key);

  @override
  State<CredentialScreen> createState() => _CredentialScreenState();
}

class _CredentialScreenState extends State<CredentialScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
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
                  "Elle a été developpée par Charles Affouard connu sous le pseudo Durgrim",
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
                  "App Version: Alpha v1.0.0",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Changement pour cette version:\n-Refonte des calculs de points\n-Refonte de l'aide pour le calcul des scores\n-Rajout du Supplément Géant",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Vous souhaitez être au courant de chaque nouveauté ?",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () => _lunchDiscord(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.discord,
                        size: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Rejoigner le discord",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () => _lunchLinkedin(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.linkedin,
                        size: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Mon Linkedin",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
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
      Uri.parse("https:://www.linkedin.com/in/charlesaffouard"),
    )) {
      throw Exception('Could not launch Linekdin');
    }
  }

  Future<void> _lunchDiscord() async {
    if (!await launchUrl(
      Uri.parse("https://discord.gg/jr3NA7teaV"),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch Linekdin');
    }
  }
}
