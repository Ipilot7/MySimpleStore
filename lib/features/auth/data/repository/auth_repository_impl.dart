import 'dart:convert';

import 'package:my_simple_store/core/errors/errors.dart';
import 'package:my_simple_store/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:my_simple_store/core/netwok/network_info.dart';
import 'package:my_simple_store/features/auth/data/data_sourse/forgot_password_data_sourse.dart';
import 'package:my_simple_store/features/auth/data/data_sourse/registration_data_source.dart';
import 'package:my_simple_store/features/auth/data/data_sourse/sign_in_data_sourse.dart';
import 'package:my_simple_store/features/auth/domain/entities/registration_model.dart';
import 'package:my_simple_store/features/auth/domain/entities/sign_in_result_model.dart';

import '../../domain/repositoryies/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SignInDataSourse signInDataSourse;
  final RegistrationDataSource registrationDataSource;
  final ForgotPasswordDataSource forgotPasswordDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.registrationDataSource,
    required this.networkInfo,
    required this.signInDataSourse,
    required this.forgotPasswordDataSource,
  });
  @override
  Future<Either<Failure, SignInResultModel>> signIn(
      {required String email, required String code}) async {
    if (await networkInfo.isConnected) {
      try {
        final String result =
            await signInDataSourse.signIn(email: email, code: code);
        return Right(SignInResultModel.fromJson(json.decode(result)));
      } on ServerException {
        return Left(ServerFailure());
      } on BazeException {
        return Left(BazeFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> registration(
      {required RegistrationModel registrationModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await registrationDataSource.registration(
            registrationModel: registrationModel);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      } on BazeException {
        return Left(BazeFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> sendEmailFPassword(
      {required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await forgotPasswordDataSource.sendEmailFPassword(email: email);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
  
  @override
  Future<Either<Failure, String>> verifyCodeFPassword({required String code}) {
    // TODO: implement verifyCodeFPassword
    throw UnimplementedError();
  }
}
