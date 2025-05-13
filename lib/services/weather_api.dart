import 'dart:convert';
import 'package:http/http.dart' as http;

const String weatherApiKey = '66591a28938f5b0515b52124b2adf649';

Future<dynamic> getJSON(String endpoint) async {
  final url = Uri.parse(endpoint);
  final response = await http.get(url);
  return jsonDecode(response.body);
}