// import 'dart:html';

import 'package:contacts_app/src/controller/auth_cubit/cubit/auth_repository.dart';
import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  Future<void> login(String email, String password) async {
    emit(AuthStateLoading());

    AuthRepository authRepository = AuthRepository();

    try {
      ApiResponse apiResponse = await authRepository.login(email, password);
      if (apiResponse.Status == true) {
        emit(AuthStateAuthenticated(email));
      } else {
        emit(AuthStateAuthenticated("Invalid Credentials"));
      }
    } catch (e) {
      emit(AuthStateAuthenticated("Authentication Error"));
    }
  }
}
