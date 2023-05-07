import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_simple_store/features/auth/domain/entities/sign_in_result_model.dart';
import 'package:my_simple_store/features/auth/domain/usecases/sign_in_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

final serverErrorMessage = 'Error with connection cerver';
final connectionErrorMessage = 'Error with connection internet';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInUseCase signInUseCase;

  SignInBloc({required this.signInUseCase}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<SignInAccountEvent>((event, emit) async {
      emit(SignInLoadingState());
      final signInResult = await signInUseCase
          .call(SignInParams(email: event.email, code: event.code));
      signInResult.fold(
        (l) => emit(SignInErrorState(message: serverErrorMessage)),
        (r) => emit(SignInLoadedState(result: r)),
      );
    });
  }
}
