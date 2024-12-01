// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/auth/entities/user_entity.dart';

import 'package:food_ninja/auth/usescases/user_sign_up.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final UserSignUp _userSignUp;
  AuthBlocBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthBlocInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final resp = await _userSignUp(UserSignUpEntity(
          email: event.email,
          username: event.username,
          password: event.password));

      resp.fold((fail) => emit(AuthFailure(fail.message)),
          (user) => emit(AuthSucess(user.id)));
    });
  }
}
