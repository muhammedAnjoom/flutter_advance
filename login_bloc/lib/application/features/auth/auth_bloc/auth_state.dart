part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  User? user;
  Authenticated({this.user});
}

class UnAuthenticated extends AuthState {}

class AuthenticatedError extends AuthState {
  final String message;

  AuthenticatedError({
    required this.message,
  });
}

class PhoneVerfiedState extends AuthState{
  final String verficationCode;

  PhoneVerfiedState({required this.verficationCode});
}
