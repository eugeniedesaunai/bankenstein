import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:bankenstein/core/router.dart';
import 'package:bankenstein/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
      lazy: false,
      create: (_) {
        final cubit = AuthenticationCubit();
        return cubit;
      },
      child: Builder(builder: (context) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF711CCC)),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router(context),
        );
      }),
    );
  }
}
