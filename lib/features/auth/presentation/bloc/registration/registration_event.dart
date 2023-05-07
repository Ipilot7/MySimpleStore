part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationAccountEvent extends RegistrationEvent {
  final RegistrationModel registrationModel;
  const RegistrationAccountEvent({required this.registrationModel});

}
