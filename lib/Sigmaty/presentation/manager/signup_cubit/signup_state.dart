part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

final class SignupInitial extends SignupState {}
final class SignupSuccess extends SignupState {}
final class SignupLoading extends SignupState {}
final class SignupFailure extends SignupState {}
