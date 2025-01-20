import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather_feature/data/services/weather_service.dart';
import 'package:weather/features/weather_feature/domain/usecase/get_weather_usecase.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
          getWeatherUseCase: GetWeatherUseCase(
        weatherRepository:
            WeatherRepositoryImpl(weatherService: WeatherService()),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          centerTitle: true,
        ),
        body: WeatherBody(),
      ),
    );
  }
}

class WeatherBody extends StatefulWidget {
  @override
  _WeatherBodyState createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  final placeController = TextEditingController();

  @override
  void dispose() {
    placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  decoration:
                      const InputDecoration(hintText: 'Enter the place'),
                  controller: placeController,
                ),
              ),
              IconButton(
                onPressed: () {
                  final address = placeController.text.trim();
                  if (address.isNotEmpty) {
                    BlocProvider.of<WeatherBloc>(context)
                        .add(FetchWeather(address));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a place.')),
                    );
                  }
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  return Center(
                    child: Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address: ${state.weather.resolvedAddress}',
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(
                          'Temperature: ${state.weather.temperature}°C',
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(
                          'Condition: ${state.weather.description}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                      child: Text('Enter a place to get weather.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
