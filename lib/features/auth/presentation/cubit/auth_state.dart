part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class RevealPassword extends AuthState {}

class ButtonTurned extends AuthState {}

class LoginAuthenticating extends AuthState {}

class LoginAuthenticated extends AuthState {}

class LoginError extends AuthState {}
