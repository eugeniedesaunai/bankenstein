import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            label: Text('Email'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            label: Text('Password'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
              // permet d'appeler le signIn du cubit afin d'essaye de connexion
              onPressed: () async {
                await context.read<AuthenticationCubit>().signIn(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );
              },
              child: const Text(
                'Sign In',
              ),
            ),
          ],
        ),

        // gestion d'erreur pour la connexion
        Row(
          children: [
            BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state is AuthenticationStateError) {
                  return const Center(
                    child: Text(
                      'Wrong email or password',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ],
    );
  }
}
