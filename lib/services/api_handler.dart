import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/resources/string_manager.dart';

class APIHandler {
  //  Get all egypt data from internet
  //  Get all (bbc-news, the-next-web) data from internet
  static Future<dynamic> getData({required String url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw data['message'];
      }
    } on SocketException {
      // Internet connection error
      throw AppString.checkInternetConnection;
    } on FormatException {
      // Error from the backend
      throw AppString.formatException;
    } catch (exception) {
      throw exception.toString();
    }
  }
}
