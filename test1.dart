import 'package:flutter/material.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  const BottomNavigationBarComponent(
      {super.key,
      required this.color,
      required this.currentIndex,
      required Null Function(dynamic index) onTap});
  final Color color;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: color,
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        backgroundColor: color,
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
      ),
    );
  }
}
