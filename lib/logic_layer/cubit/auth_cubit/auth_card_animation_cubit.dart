import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_card_animation_state.dart';

class AuthCardAnimationCubit extends Cubit<AuthCardAnimationState> {
  AuthCardAnimationCubit() : super(AuthCardAnimationInitial());

  bool loginIsNotHittable = false;
  bool signUpIsNotHittable = false;

  void showSignupCard() {
    emit(SignUpCardState());
  }

  Timer loginTimer() =>
      Timer(const Duration(seconds: 2), () => loginIsNotHittable = true);
  Timer signUpTimer() =>
      Timer(const Duration(seconds: 1), () => signUpIsNotHittable = true);

  void showLoginCard() {
    emit(LoginCardState());
  }
}
