import 'package:bankenstein/models/user_model.dart';
import 'package:bankenstein/presentation/pages/preference_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankenstein/blocs/user_cubbit.dart';
import 'package:bankenstein/models/user_firebase_model.dart';
import 'package:bankenstein/presentation/component/app_bar.dart';
import 'package:bankenstein/presentation/component/bottom_navigation_bar.dart';
import 'package:bankenstein/presentation/component/home_body.dart';
import 'package:bankenstein/services/authentication_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const name = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return StreamBuilder<UserFirebaseModel?>(
      stream: AuthenticationService.status(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;

          if (user != null && user.email != null) {
            return BlocProvider<UserCubit>(
              create: (_) {
                final userCubit = UserCubit();
                userCubit.getOneUser(user.email!);
                return userCubit;
              },
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserStateLoaded) {
                    return Scaffold(
                      appBar: AppBarComponent(
                        user: state.user,
                        pageName: HomePage.name,
                        color: primaryColor,
                      ),
                      body: _getBody(state.user),
                      bottomNavigationBar: BottomNavigationBarComponent(
                        currentIndex: _currentIndex,
                        onTap: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        color: primaryColor,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _getBody(UserModel user) {
    switch (_currentIndex) {
      case 0:
        return HomeBody(user: user);
      case 1:
        return PreferencePage(); // Placeholder for now
      default:
        return Container(); // Placeholder for now
    }
  }
}
