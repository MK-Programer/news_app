import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class APIHandler {
  static Future<dynamic> getEgyptData() async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=f3d3b7b7f9374af9a9aa34b13704ad6a',
        ),
      );
      var data = jsonDecode(response.body);
      print(response.statusCode);
      if (response.statusCode != 200) {
        throw (data['code']);
      }
      print(data);
      return data;
    } catch (error) {
      throw error.toString();
    }
  }
}
