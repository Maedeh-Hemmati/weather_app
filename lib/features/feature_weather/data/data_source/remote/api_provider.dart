import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/constants.dart';

class ApiProvider {
  Dio dio = Dio();

  var apiKey = Constants.apiKey1;
//current weather api
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await dio.get('${Constants.baseUrl}/data/2.5/weather',
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    return response;
  }
}
