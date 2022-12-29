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
    print(response.body);
    if (response.statusCode == 200) {
      // if (response.statusCode == 200) {
      // final json = jsonDecode(response.body);
      // return routeModelFromJson(json);

      // final parsed = json.decode(response.body);
      // print(parsed);

      return routeModelFromJson(response.body);
      // .map<RouteModel>((json) => RouteModel.fromJson(json))
      // .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
