import 'package:http/http.dart' as http;
import 'dart:convert';
import 'city.dart';
import 'weather_forecast.dart';

class Request {
  final Function functionToAccessDataseries;

  Request(this.functionToAccessDataseries);
  Future<String> cityApi(String cityName) async {
    String apiKey = "XlukLS7rAatrfSQcFty3Ow==PMzAAYiGLEDMbQN5";
    var uri = Uri.https("api.api-ninjas.com", "/v1/city", {
      "name": cityName,
    });

    var response = await http.get(uri, headers: {'X-Api-Key': apiKey});

    final jsonCity = jsonDecode(response.body);
    var dataCity = City.fromJson(jsonCity[0]);
    forecastApiCall(dataCity.lat, dataCity.lon)
        .then((value) => functionToAccessDataseries(value));
    return "Lat: ${dataCity.lat.toString()} Lon: ${dataCity.lon.toString()}";
  }

  Future<List> forecastApiCall(double lat, double lon) async {
    var response =
        await http.get(Uri.http('www.7timer.info', '/bin/astro.php', {
      'lon': lon.toString(),
      'lat': lat.toString(),
      'ac': '0',
      'unit': 'metric',
      'output': 'json',
      'tzshift': '0'
    }));

    Map<String, dynamic> json = jsonDecode(response.body);
    var data = WeatherForecast.fromJson(json);

    return data.dataseries.toList();
  }
}
