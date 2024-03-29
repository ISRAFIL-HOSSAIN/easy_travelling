import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api.dart';
import '../model/Route_model.dart';

class ApiService {
  static var client = http.Client();

  static Future<RouteModel> fetchRouteData() async {
    var headers = {'Content-Type': 'application/json'};
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.route);
    Map body = {
      'user_id': 0,
    };
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);
    // print("Route Model Data is :........");
    // print(response.body);
    if (response.statusCode == 200) {
      return routeModelFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
