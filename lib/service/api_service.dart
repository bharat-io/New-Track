import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:newstrack/utill/app_const.dart';

class ApiService {
  Future<dynamic> getNews(String endpoint) async {
    final response = await https.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final mapData = jsonDecode(response.body);

      return mapData;
    } else {
      print("error : ${response.statusCode}");
    }
  }
}
