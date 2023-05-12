import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:my_simple_store/core/errors/errors.dart';

abstract class ForgotPasswordDataSource {
  Future<String> sendEmailFPassword({required String email});
  Future<String> verifyCodeFPassword({required String code});
}

class ForgotPasswordDataSourceImpl implements ForgotPasswordDataSource {
  final http.Client client;
  ForgotPasswordDataSourceImpl({required this.client});
  @override
  Future<String> sendEmailFPassword({required String email}) async {
    final response = await client.post(
      Uri.parse("https://wallefy-gvat.onrender.com/api/auth/forgotPassword"),
      body: '''{"email": $email}''',
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ServerException();
  }

  @override
  Future<String> verifyCodeFPassword({required String code}) async {
    final response = await client.post(
      Uri.parse(
          "https://wallefy-gvat.onrender.com/api/auth/verifyForgot/6448fd239cc582d03b18d1cf"),
    );
    return '';
  }
}
