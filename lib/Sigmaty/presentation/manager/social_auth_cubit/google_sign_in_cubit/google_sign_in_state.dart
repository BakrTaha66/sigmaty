part of 'google_sign_in_cubit.dart';

@immutable
abstract class GoogleSignInState {}

final class GoogleSignInInitial extends GoogleSignInState {}

final class GoogleSignInSuccess extends GoogleSignInState {}

final class GoogleSignInLoading extends GoogleSignInState {}

final class GoogleSignInFailure extends GoogleSignInState {
  final String message;

  GoogleSignInFailure(this.message);
}
