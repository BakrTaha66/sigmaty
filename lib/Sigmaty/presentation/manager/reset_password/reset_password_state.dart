part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordSuccess extends ResetPasswordState {}
final class ResetPasswordLoading extends ResetPasswordState {}
final class ResetPasswordFailure extends ResetPasswordState {}
