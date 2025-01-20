import 'package:weather/features/weather_feature/data/models/weather_model.dart';
import 'package:weather/features/weather_feature/data/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase({required this.weatherRepository});

  Future<WeatherModel> call(String address) async {
    return await weatherRepository.getWeather(address);
  }
}
