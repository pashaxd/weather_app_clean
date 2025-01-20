import '../entity/weather.dart';

abstract interface class WeatherRepository {
  Weather getWeather();
}
