import 'package:my_simple_store/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_simple_store/core/usecase/usecase.dart';
import 'package:my_simple_store/features/auth/domain/repositoryies/auth_repository.dart';

class SendEmailFPasswordUsecase extends UseCase<String, String> {
  final AuthRepository authRepository;
  SendEmailFPasswordUsecase({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(String params) {
    return authRepository.sendEmailFPassword(email: params);
  }
}


