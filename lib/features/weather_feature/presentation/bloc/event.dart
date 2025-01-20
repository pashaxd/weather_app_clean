abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String address;

  FetchWeather(this.address);
}
