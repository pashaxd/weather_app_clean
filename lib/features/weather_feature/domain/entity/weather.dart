import 'package:weather/features/weather_feature/data/models/weather_model.dart';

class Weather extends WeatherModel {
  Weather(
      {required super.description,
      required super.temperature,
      required super.resolvedAddress});
}
