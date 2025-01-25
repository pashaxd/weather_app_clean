class WeatherModel {
  final List<dynamic> days;
  final String resolvedAddress;

  WeatherModel({required this.days, required this.resolvedAddress});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      days: json['days'],
      resolvedAddress: json['resolvedAddress'],
    );
  }
}
