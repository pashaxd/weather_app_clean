import 'package:weather/features/weather_feature/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(String address);
}
