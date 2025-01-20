import 'package:weather/features/weather_feature/data/models/weather_model.dart';
import 'package:weather/features/weather_feature/data/repositories/weather_repository.dart';

import '../services/weather_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService weatherService;

  WeatherRepositoryImpl({required this.weatherService});

  @override
  Future<WeatherModel> getWeather(String address) async {
    return await weatherService.fetchWeather(address);
  }
}
