part of 'signout_cubit.dart';

@immutable
abstract class SignOutState {}

final class SignOutInitial extends SignOutState {}

final class SignOutSuccess extends SignOutState {}

final class SignOutLoading extends SignOutState {}

final class SignOutFailure extends SignOutState {}
