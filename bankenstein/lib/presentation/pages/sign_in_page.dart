import 'package:bankenstein/presentation/component/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const name = 'sign-in';

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance, // Icône de banque
                color: Color(
                    0xFF711CCC), // Couleur de l'icône (bleu dans cet exemple)
                size: 60,
              ), // Ajoutez votre icône de banque ici
              SizedBox(width: 8), // Espacement entre l'icône et le texte
              Text(
                'Bankestein',
                style: TextStyle(
                  color: Color(0xFF711CCC),
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(width: 32),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SignInForm(),
          ),
        ],
      ),
    );
  }
}
