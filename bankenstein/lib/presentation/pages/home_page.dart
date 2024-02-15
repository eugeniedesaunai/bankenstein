import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const name = 'home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Row(
          children: [
            Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthenticationCubit>().logOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Alexis Vandepitte',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Use the navigation bar to go to your accounts or to transfer money',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
