part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckLoginStatusEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class SignupEvent extends AuthEvent {
  final UserModel user;

  SignupEvent({
    required this.user,
  });
}

class LogoutEvent extends AuthEvent {}

class PhoneNumberLoginEvent extends AuthEvent {
  final String phone;

  PhoneNumberLoginEvent({required this.phone});
}

class OtpSentEvent extends AuthEvent {
  final String otp;
  final String verficationCode;

  OtpSentEvent({required this.otp, required this.verficationCode});
}

class RestPassswordEvent extends AuthEvent {
  final String email;
  final BuildContext context;
  RestPassswordEvent({
    required this.email,
    required this.context
  });
}

class LoginGoogleEvent extends AuthEvent {}
