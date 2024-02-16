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
          Row(
            children: [
              SeetingButtonTheme(
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                color: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
        ],
      ),
    );
  }
}
