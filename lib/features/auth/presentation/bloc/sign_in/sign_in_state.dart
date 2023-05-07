part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInLoadedState extends SignInState {
  final SignInResultModel result;
  SignInLoadedState({required this.result});
  @override
  List<Object?> get props => [result];
}

class SignInErrorState extends SignInState {
  SignInErrorState({required this.message});
  final String message;
}
