import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:palmhelp/army_screen.dart';
import 'package:palmhelp/book_screen.dart';
import 'package:palmhelp/credential_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;

  static final List<Widget> _pages = [
    BookScreen(),
    Container(
      child: Text("Mettre la recherche ici ?"),
    ),
    ArmyScreen(),
    CredentialScreen(),
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
              Icons.home,
            ),
            label: "Accueil",
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
        // selectedFontSize: ,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}
