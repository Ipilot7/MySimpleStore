import 'package:dartz/dartz.dart';
import 'package:my_simple_store/core/errors/failures.dart';
import 'package:my_simple_store/features/auth/domain/entities/registration_model.dart';
import 'package:my_simple_store/features/auth/domain/entities/sign_in_result_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInResultModel>> signIn(
      {required String email, required String code});
  Future<Either<Failure, String>> registration(
      {required RegistrationModel registrationModel});
}
