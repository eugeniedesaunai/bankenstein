import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:bankenstein/models/user_model.dart';
import 'package:bankenstein/presentation/pages/preference_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  AppBarComponent({
    Key? key,
    required this.user,
    required this.pageName,
    required this.color,
  });

  final UserModel user;
  final String pageName;
  final Color color;

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text; // Vérifiez si la chaîne est vide
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: Row(
        children: [
          Text(
            capitalizeFirstLetter(pageName),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Text(
              '${user.firstName} ${user.lastName}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {
                  context.pushNamed(PreferencePage.name);
                },
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                )),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
