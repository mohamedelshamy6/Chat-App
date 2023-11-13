import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_card_animation_state.dart';

class AuthCardAnimationCubit extends Cubit<AuthCardAnimationState> {
  AuthCardAnimationCubit() : super(AuthCardAnimationInitial());
  bool isShowLoginCard = true;
   void showSignupCard() {
    isShowLoginCard = false;
    emit(AuthCardAnimationSuccessState());
  }
   void showLoginCard() {
    isShowLoginCard = true;
    emit(AuthCardAnimationSuccessState());
  }
}
