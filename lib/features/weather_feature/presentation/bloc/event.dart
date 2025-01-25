abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String address;

  FetchWeather(this.address);
}

class ChangeDay extends WeatherEvent {
  final String day;
  ChangeDay({required this.day});
}
