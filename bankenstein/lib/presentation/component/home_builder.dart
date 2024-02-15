import 'package:bankenstein/blocs/user_cubbit.dart';
import 'package:bankenstein/models/user_firebase_model.dart';
import 'package:bankenstein/services/authentication_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilisateur connecté, affichage de l'e-mail
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserStateLoaded) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome ${state.user.firstName} ${state.user.lastName}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Text(
                    'Use the navigation bar to go to your accounts or to transfer money',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
        return const Text('Une erreur c\'est produite');
      },
    );
  }
}
