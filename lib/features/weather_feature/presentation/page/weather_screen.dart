import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather_feature/presentation/bloc/bloc.dart';
import 'package:weather/features/weather_feature/presentation/page/weather_body.dart';

import '../../data/repositories/weather_repository_impl.dart';
import '../../data/services/weather_service.dart';
import '../../domain/usecase/get_weather_usecase.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        getWeatherUseCase: GetWeatherUseCase(
          weatherRepository:
              WeatherRepositoryImpl(weatherService: WeatherService()),
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0xFF0f1026),
        appBar: AppBar(
          backgroundColor: Color(0xFF0f1026),
          title: const Text('Weather', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: WeatherBody(),
      ),
    );
  }
}
