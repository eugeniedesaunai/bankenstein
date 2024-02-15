import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const name = 'home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthenticationCubit>().logOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Placeholder(),
    );
  }
}
