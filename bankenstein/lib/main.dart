import 'package:bankenstein/blocs/authentication_cubbit.dart';
import 'package:bankenstein/core/router.dart';
import 'package:bankenstein/firebase_options.dart';
import 'package:bankenstein/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
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
          // englobe l'app dans les deux themes
          theme: Provider.of<ThemeProvider>(context).themeData,
          routerConfig: AppRouter.router(context),
        );
      }),
    );
  }
}
