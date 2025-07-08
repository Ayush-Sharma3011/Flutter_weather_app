import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      headers: {
        'x-api-key': 'reqres-free-v1',
      },
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // print("Login success: ${response.body}");
      return true;
    } else {
      // print("Login failed: ${response.statusCode} - ${response.body}");
      return false;
    }
  }
}
