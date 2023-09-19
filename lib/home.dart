import 'package:flutter/material.dart';
import 'package:palmhelp/army/army_screen.dart';
import 'package:palmhelp/book_screen.dart';
import 'package:palmhelp/credential_screen.dart';
import 'package:palmhelp/score_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;

  static final List<Widget> _pages = [
    const BookScreen(),
    const ScoreScren(),
    const ArmyScreen(),
    const CredentialScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("PalmHelp"),
      ),
      body: Center(
        child: _pages.elementAt(_selectedItem),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: "Livre d'armée",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.score,
            ),
            label: "Fin de Partie",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.all_inbox,
            ),
            label: "Armée",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chrome_reader_mode_outlined,
            ),
            label: "Crédits",
          ),
        ],
        currentIndex: _selectedItem,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.grey[900],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}
