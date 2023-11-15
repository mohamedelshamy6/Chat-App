part of 'auth_card_animation_cubit.dart';

@immutable
sealed class AuthCardAnimationState {}

final class AuthCardAnimationInitial extends AuthCardAnimationState {}

final class LoginCardState extends AuthCardAnimationState {}
final class SignUpCardState extends AuthCardAnimationState {}
