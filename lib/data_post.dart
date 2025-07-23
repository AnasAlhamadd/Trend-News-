import 'dart:convert';

import 'package:http/http.dart' as http;

class DataPost {
  Future<void> postMethode(
      {required String emailCat, required String passwordCat}) async {
    String baseUrl = 'https://jsonplaceholder.typicode.com/posts/';
    final url = Uri.parse(baseUrl);
    Map<String, dynamic> body = {'username': emailCat, 'password': passwordCat};
    String bodyJson = jsonEncode(body);
    http.Response responce = await http.post(
      url,
      body: bodyJson,
      headers: {
        "Content-type": "application/json",
        "Authorization":
            " eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJtaWNoYWVsdyIsImVtYWlsIjoibWljaGFlbC53aWxsaWFtc0B4LmR1bW15anNvbi5jb20iLCJmaXJzdE5hbWUiOiJNaWNoYWVsIiwibGFzdE5hbWUiOiJXaWxsaWFtcyIsImdlbmRlciI6Im1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL21pY2hhZWx3LzEyOCIsImlhdCI6MTcxNzYxMTc0MCwiZXhwIjoxNzE3NjE1MzQwfQ.eQnhQSnS4o0sXZWARh2HsWrEr6XfDT4ngh0ejiykfH8"
      },
    );
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      print(responce.body);
    } else {
      print('error');
    }
  }
}
