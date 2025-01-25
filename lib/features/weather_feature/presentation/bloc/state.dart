import '../../data/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  final String selectedDay;

  WeatherLoaded(this.weather, this.selectedDay);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
