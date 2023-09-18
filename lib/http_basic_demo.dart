import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  String url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));

  Map<String, dynamic> data = jsonDecode(response.body);
  print('userId : ${data['userId']}');
}