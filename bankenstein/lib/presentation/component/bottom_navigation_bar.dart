import 'package:bankenstein/presentation/pages/home_page.dart';
import 'package:bankenstein/presentation/pages/preference_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  _BottomNavigationBarComponentState createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Ajoutez ici la logique de navigation vers vos pages en fonction de l'index.
    // Par exemple :
    if (index == 0) {
      context.pushNamed(HomePage.name);
    } else if (index == 1) {
      context.pushNamed(PreferencePage.name);
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

// class BottomNavigationBarComponent extends StatelessWidget {
//   const BottomNavigationBarComponent({
//     super.key,
//     required this.color,
//   });
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(
//         canvasColor: color,
//       ),
//       child: BottomNavigationBar(
//         showSelectedLabels: false,
//         backgroundColor: color,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_balance_wallet_rounded),
//             label: 'Account',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.supervisor_account),
//             label: 'Recipient',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.compare_arrows),
//             label: 'Transfer',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Preference',
//           ),
//         ],
//       ),
//     );
//   }
// }
