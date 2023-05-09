import 'dart:convert';
import 'dart:developer';

import 'package:my_simple_store/core/errors/errors.dart';
import 'package:my_simple_store/core/errors/failures.dart';
import 'package:my_simple_store/features/auth/domain/entities/registration_model.dart';
import 'package:http/http.dart' as http;

abstract class RegistrationDataSource {
  Future<String> registration({required RegistrationModel registrationModel});
}

class RegistrationDataSourceImpl implements RegistrationDataSource {
  final http.Client client;
  RegistrationDataSourceImpl({required this.client});
  @override
  Future<String> registration(
      {required RegistrationModel registrationModel}) async {
    log(jsonEncode(registrationModel));

    final response = await client.post(
      Uri.parse('https://wallefy-gvat.onrender.com/api/auth/regis'),
      body: jsonEncode(registrationModel),
    );
    log(jsonEncode(registrationModel));
    log(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 404) {
      throw BazeException();
    }
    throw ServerException();
  }
}
