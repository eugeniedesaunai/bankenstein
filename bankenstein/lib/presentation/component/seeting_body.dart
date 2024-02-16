import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:bankenstein/presentation/component/seeting_button_theme.dart';
import 'package:bankenstein/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeetingBody extends StatelessWidget {
  const SeetingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeetingButtonTheme(
                  onTap: () {
                    // appel la méthode pour switcher de theme
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  text: "Change theme",
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  height: 32,
                ),
                SeetingButtonTheme(
                  onTap: () {
                    // appel la méthode pour switcher de theme
                    context.read<AuthenticationCubit>().logOut();
                  },
                  text: "Logout",
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
