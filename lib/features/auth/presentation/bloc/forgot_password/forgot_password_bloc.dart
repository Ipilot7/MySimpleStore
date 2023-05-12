import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_simple_store/features/auth/domain/usecases/send_email_f_password_usecase.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final SendEmailFPasswordUsecase sendEmailFPasswordUsecase;
  ForgotPasswordBloc({required this.sendEmailFPasswordUsecase})
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) {});
    on<SendEmailForgotPasswordEvent>(
      (event, emit) async {
        emit(ForgotPasswordLoadingState());
        final result = await sendEmailFPasswordUsecase.call(event.email);
        result.fold(
          (l) => emit(const ForgotPasswordErrorState(message: "Server Exception")),
          (r) => emit(ForgotPasswordLoadedState(result: r)),
        );
      },
    );
  }
}
