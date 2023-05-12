part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class SendEmailForgotPasswordEvent extends ForgotPasswordEvent {
  final String email;
  const SendEmailForgotPasswordEvent({required this.email});
}

class VerifyCodeForgotPUseCase extends ForgotPasswordEvent {
  final String code;
  const VerifyCodeForgotPUseCase({required this.code});
}
