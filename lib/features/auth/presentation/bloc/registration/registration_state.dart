part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
  
  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState{
  
}
class RegistrationLoadedState extends RegistrationState {
  final String result;
  const RegistrationLoadedState({required this.result});
  @override
  List<Object> get props => [result ];
}

class RegistrationErrorState extends RegistrationState {
  const RegistrationErrorState({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}