import 'dart:convert';

import 'package:demo/constants/strings.dart';
import 'package:demo/models/gst-info.dart';
import 'package:http/http.dart' as http;

List<Welcome> parseVideos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Welcome>((json) => Welcome.fromMap(json)).toList();
}

class ApiManager {
  Future<List<Welcome>> getNews() async {
    var client = http.Client();
    var response =
        await client.get(Uri.https('sheetdb.io', '/api/v1/pt43u31of08h0'));
    print(response.body);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      return parseVideos(jsonString);
    }
  }
}
