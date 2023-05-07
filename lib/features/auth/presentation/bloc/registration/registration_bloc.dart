import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_simple_store/features/auth/domain/entities/registration_model.dart';
import 'package:my_simple_store/features/auth/domain/usecases/registration_usecase.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationUseCase registrationUseCase;
  RegistrationBloc({required this.registrationUseCase})
      : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) {});
    on<RegistrationAccountEvent>(
      (event, emit) async {
        emit(RegistrationLoadingState());
        final result = await registrationUseCase.call(event.registrationModel);
        result.fold(
          (l) => emit(const RegistrationErrorState(message: 'ERROR')),
          (r) => emit(RegistrationLoadedState(result: r)),
        );
      },
    );
  }
}
