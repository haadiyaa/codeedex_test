import 'package:codeedex_test/core/apikeys.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<http.Response> login(
      {required String email, required String password}) async {
    final uri = Uri.parse(ApiKeys.login);
    final body = {
      "email": email,
      "password": password,
    };
    final response = await http.post(
      uri,
      body: body,
    );
    return response;
  }

  Future<http.Response> getProducts() async {
    final uri = Uri.parse('${ApiKeys.base}${ApiKeys.products}');
    final response = await http.get(uri);
    return response;
  }

  Future<http.Response> getCategory() async {
    final uri = Uri.parse('${ApiKeys.base}${ApiKeys.categories}');
    final response = await http.get(uri);
    return response;
  }
}
