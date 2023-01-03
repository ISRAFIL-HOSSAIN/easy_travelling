import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api.dart';
import '../model/City_model.dart';

class CityService {
  static var client = http.Client();

  static Future<CityModel> fetchCityData(int id) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.city);
    Map body = {
      'user_id': 7,
      'route_id': 3,
      'city_id': id,
    };
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);
    print("City Data is : ....................");
    print(response.body);
    if (response.statusCode == 200) {
      return cityModelFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
