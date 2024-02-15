import 'package:bankenstein/models/user_model.dart';
import 'package:bankenstein/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserState {}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateLoaded extends UserState {
  UserStateLoaded({required this.user});

  final UserModel user;
}

class UserStateError extends UserState {
  UserStateError({required this.message});

  final String message;
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserStateInitial());

  // Future<void> getUsers() async {
  //   emit(UserStateLoading());
  //   try {
  //     final users = await UserService.getUsers();
  //     emit(UserStateLoaded(users: users));
  //   } catch (e) {
  //     emit(UserStateError(message: e.toString()));
  //   }
  // }

  Future<void> getOneUser(String email) async {
    emit(UserStateLoading());
    try {
      final user = await UserService.getOneUser(email);

      if (user != null) {
        emit(UserStateLoaded(user: user));
      } else {
        emit(UserStateError(
            message: "Aucun véhicule trouvé pour l'ID spécifié"));
      }
    } catch (e) {
      emit(UserStateError(message: e.toString()));
    }
  }
}
