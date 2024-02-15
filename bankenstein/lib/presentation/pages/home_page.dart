import 'package:bankenstein/blocs/user_cubbit.dart';
import 'package:bankenstein/models/user_firebase_model.dart';
import 'package:bankenstein/presentation/component/app_bar.dart';
import 'package:bankenstein/presentation/component/bottom_navigation_bar.dart';
import 'package:bankenstein/presentation/component/home_body.dart';
import 'package:bankenstein/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const name = 'home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
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
              child:
                  BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                if (state is UserStateLoaded) {
                  return Scaffold(
                    appBar: AppBarComponent(
                      user: state.user,
                      pageName: name,
                      color: primaryColor,
                    ),
                    body: HomeBody(user: state.user),
                    bottomNavigationBar:
                        BottomNavigationBarComponent(color: primaryColor),
                  );
                }
                return const Text('Une erreur c\'est produite');
              }),
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
