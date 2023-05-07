part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInAccountEvent extends SignInEvent {
  final String email;
  final String code;
  SignInAccountEvent({required this.email, required this.code});
  @override
  List<Object?> get props => [];
}
