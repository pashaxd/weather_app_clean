import 'package:flutter/material.dart';
import 'package:weather/features/weather_feature/presentation/page/weather_body.dart';
import 'package:weather/features/weather_feature/presentation/page/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}
