class WeatherModel {
  final String description;
  final double temperature;
  final String resolvedAddress;
  WeatherModel(
      {required this.resolvedAddress,
      required this.description,
      required this.temperature});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['description'],
      temperature: json['days']['temp'],
      resolvedAddress: json['resolvedAddress'],
    );
  }
}
