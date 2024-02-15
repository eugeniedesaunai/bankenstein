import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:bankenstein/blocs/user_cubbit.dart';
import 'package:bankenstein/models/user_firebase_model.dart';
import 'package:bankenstein/presentation/component/home_builder.dart';
import 'package:bankenstein/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const name = 'home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarColor = Theme.of(context).colorScheme.primary;
// permet de récupérer l'email afin de récupérer la date de l'utilisateur connecté
    return StreamBuilder<UserFirebaseModel?>(
      stream: AuthenticationService
          .status(), // Écouter les changements de l'état de l'authentification
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user =
              snapshot.data; // Récupérer l'utilisateur actuellement connecté

          if (user != null && user.email != null) {
            return BlocProvider<UserCubit>(
              create: (_) {
                final userCubit = UserCubit();
                userCubit.getOneUser(user.email!);
                return userCubit;
              },
              child: Scaffold(
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
                body: const HomeBuilder(),
              ),
            );
          } else {
            // Aucun utilisateur connecté
            return CircularProgressIndicator();
          }
        } else {
          // La connexion à l'état de l'authentification n'est pas encore terminée
          return CircularProgressIndicator();
        }
      },
    );
  }
}
