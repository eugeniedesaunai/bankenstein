import 'package:bankenstein/presentation/pages/home_page.dart';
import 'package:bankenstein/presentation/pages/preference_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  BottomNavigationBarComponentState createState() =>
      BottomNavigationBarComponentState();
}

class BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Utilisation de switch-case pour gérer la navigation en fonction de l'index.
    switch (index) {
      case 0:
        context.goNamed(HomePage.name);
        break;
      case 1:
        // Ajoutez ici la logique pour la deuxième page.
        break;
      case 2:
        // Ajoutez ici la logique pour la troisième page.
        break;
      case 3:
        // Ajoutez ici la logique pour la quatrième page.
        break;
      case 4:
        context.pushNamed(PreferencePage.name);
        break;
      default:
        // Si l'index ne correspond à aucune des valeurs spécifiées.
        context.goNamed(HomePage.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: widget.color,
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        backgroundColor: widget.color,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Recipient',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Transfer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Preference',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
