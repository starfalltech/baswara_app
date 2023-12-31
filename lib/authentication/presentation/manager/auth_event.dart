part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginAuth extends AuthEvent {
  final String email;
  final String password;

  LoginAuth(this.email, this.password);
}

class RegisterAuth extends AuthEvent {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;
  final String rt;
  final String rw;
  final String desa;
  final File? image;

  RegisterAuth(this.name, this.phoneNumber, this.email, this.password,
      this.image, this.rt, this.rw, this.desa);
}

class PostOtpEmailAuth extends AuthEvent {
  final String email;

  PostOtpEmailAuth(this.email);
}

class PostOtpAuth extends AuthEvent {
  final String email;
  final String otp;

  PostOtpAuth(this.email, this.otp);
}

class ResetPassword extends AuthEvent {
  final String email;
  final String otp;
  final String password;

  ResetPassword(this.email, this.otp, this.password);
}

class Logout extends AuthEvent {}
