import 'package:equatable/equatable.dart';
import 'package:my_simple_store/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_simple_store/core/usecase/usecase.dart';
import 'package:my_simple_store/features/auth/domain/entities/sign_in_result_model.dart';
import 'package:my_simple_store/features/auth/domain/repositoryies/auth_repository.dart';

class SignInUseCase extends UseCase<SignInResultModel, SignInParams> {
  final AuthRepository authRepository;
  SignInUseCase({required this.authRepository});

  @override
  Future<Either<Failure, SignInResultModel>> call(params) {
    return authRepository.signIn(email: params.email, code: params.code);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String code;
  const SignInParams({required this.email, required this.code});
  @override
  List<Object?> get props => [email, code];
}
