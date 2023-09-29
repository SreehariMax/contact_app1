import 'package:contacts_app/src/controller/auth_cubit/cubit/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  Future<void> login(String email, String password) async {
    emit(AuthStateLoading());

    AuthRepository authRepository = AuthRepository();

    try {
      if (await authRepository.authenticate(email, password)) {
        emit(AuthStateAuthenticated(email));
      } else {
        emit(AuthStateAuthenticated("Invalid Credentials"));
      }
    } catch (e) {
      emit(AuthStateAuthenticated("Authentication Error"));
    }
  }
}
