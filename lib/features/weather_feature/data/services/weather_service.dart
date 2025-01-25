import 'package:dio/dio.dart';
import 'package:weather/utils/consts/api.dart';
import 'package:weather/features/weather_feature/data/models/weather_model.dart';

class WeatherService {
  final _dio = Dio();

  Future<WeatherModel> fetchWeather(String address) async {
    final api = Api(address: address);
    Response response;

    response = await _dio.get(api.apiUrl);
    final data = response.data;

    final resolvedAddress = data['resolvedAddress'];
    final days = data['days'];
    return WeatherModel(days: days, resolvedAddress: resolvedAddress);
  }
}
