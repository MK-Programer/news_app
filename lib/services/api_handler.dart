import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../services/api_consts.dart';

class APIHandler {
  static Future<dynamic> getEgyptData() async {
    try {
      // var uri = Uri.https(
      //   APIConsts.BASE_URL,
      //   '${APIConsts.UNENCODED_PATH}/top-headlines?country=eg&apiKey=f3d3b7b7f9374af9a9aa34b13704ad6a',
      // );
      var response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=f3d3b7b7f9374af9a9aa34b13704ad6a'));
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        print(data['status']);
      }
      return data['articles'];
    } catch (error) {
      throw '';
    }
  }
}
