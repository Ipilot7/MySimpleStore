part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordErrorState extends ForgotPasswordState {
  final String message;
  const ForgotPasswordErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class ForgotPasswordLoadedState extends ForgotPasswordState {
  final String result;
  const ForgotPasswordLoadedState({required this.result});
}
