import 'package:get_it/get_it.dart';
import 'package:my_simple_store/features/auth/data/data_sourse/registration_data_source.dart';
import 'package:my_simple_store/features/auth/data/data_sourse/sign_in_data_sourse.dart';
import 'package:my_simple_store/features/auth/data/repository/auth_repository_impl.dart';
import 'package:my_simple_store/features/auth/domain/repositoryies/auth_repository.dart';
import 'package:my_simple_store/features/auth/domain/usecases/registration_usecase.dart';
import 'package:my_simple_store/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:my_simple_store/features/auth/presentation/bloc/registration/registration_bloc.dart';
import 'package:my_simple_store/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';

import 'core/netwok/network_info.dart';
import 'package:http/http.dart' as http;

import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features Holidays BLoc

  //Bloc
  sl.registerFactory(() => SignInBloc(signInUseCase: sl()));
  sl.registerLazySingleton(
    () => SignInAccountEvent(email: sl(), code: sl()),
  );

  sl.registerFactory(() => RegistrationBloc(registrationUseCase: sl()));
  sl.registerLazySingleton(
      () => RegistrationAccountEvent(registrationModel: sl()));

  //Repositoyies
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      signInDataSourse: sl(), registrationDataSource: sl(), networkInfo: sl()));

  //Use Cases
  sl.registerLazySingleton(
    () => SignInUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton(() => RegistrationUseCase(authRepository: sl()));

  // Data Sourse
  sl.registerLazySingleton<SignInDataSourse>(
      () => SignInDataSourseImpl(client: sl()));

  sl.registerLazySingleton<RegistrationDataSource>(
      () => RegistrationDataSourceImpl(client: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(interConnection: sl()));

  //!Extarnal
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
