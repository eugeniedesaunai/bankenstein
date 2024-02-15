import 'package:bankenstein/presentation/component/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const name = 'sign-in';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bankenstein'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SignInForm(),
      ),
    );
  }
}
