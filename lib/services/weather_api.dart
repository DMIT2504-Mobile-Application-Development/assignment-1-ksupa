import 'dart:convert';
import 'package:http/http.dart' as http;

const String weatherApiKey = '66591a28938f5b0515b52124b2adf649';
const String currentWeatherEndpoint = 'https://api.openweathermap.org/data/2.5/weather';

Future<dynamic> getJSON(String endpoint) async {
  final url = Uri.parse(endpoint);
  final response = await http.get(url);
  return jsonDecode(response.body);
}

Future<dynamic> getWeatherForCity({required String city}) async {
  try {
    final url = '$currentWeatherEndpoint?units=metric&q=$city&appid=$weatherApiKey';
    final response = await http.get(Uri.parse(url));

    if(response.statusCode != 200) {
      throw Exception('There was a problem with the request: status ${response.statusCode} received.');
    }
    else {
      return jsonDecode(response.body);
    }
  }

  catch (error) {
    throw Exception('There was a problem with the request: ${error.toString()}.');
  }
}