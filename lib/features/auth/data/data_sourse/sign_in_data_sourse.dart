import 'package:http/http.dart' as http;
import 'package:my_simple_store/core/errors/errors.dart';

abstract class SignInDataSourse {
  Future<String> signIn({required String email, required String code});
}

class SignInDataSourseImpl implements SignInDataSourse {
  final http.Client client;
  SignInDataSourseImpl({required this.client});
  @override
  Future<String> signIn({required String email, required String code}) async {
    final response = await client.post(
      Uri.parse('https://wallefy-gvat.onrender.com/api/auth/login'),
      body: {"email": email, "password": code},
    );
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 404) {
      throw BazeException();
    }
    throw ServerException();
  }
}
