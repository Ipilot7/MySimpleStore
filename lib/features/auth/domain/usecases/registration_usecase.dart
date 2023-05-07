import 'package:equatable/equatable.dart';
import 'package:my_simple_store/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_simple_store/core/usecase/usecase.dart';
import 'package:my_simple_store/features/auth/domain/entities/registration_model.dart';
import 'package:my_simple_store/features/auth/domain/repositoryies/auth_repository.dart';

class RegistrationUseCase extends UseCase<String, RegistrationModel> {
  final AuthRepository authRepository;
  RegistrationUseCase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(params) {
    return authRepository.registration(registrationModel: params);
  }
}

class RegistrationParams extends Equatable {
  final String username;
  final String lastname;
  final String email;
  final String password;
  const RegistrationParams({
    required this.lastname,
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  List<Object?> get props => [username, lastname, email, password];
}
