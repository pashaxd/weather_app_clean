import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_search_controller.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';
import 'package:weather/features/weather_feature/data/services/weather_service.dart';
import 'package:weather/features/weather_feature/domain/usecase/get_weather_usecase.dart';
import 'package:weather/features/weather_feature/presentation/page/weather_for_next_7_days.dart';
import 'package:weather/features/weather_feature/presentation/page/weather_today.dart';
import 'package:weather/features/weather_feature/presentation/page/weather_tomorrow.dart';
import 'package:weather/features/weather_feature/presentation/widgets/big_card.dart';
import 'package:weather/features/weather_feature/presentation/widgets/mini_card.dart';
import 'package:weather/features/weather_feature/presentation/widgets/text_button.dart';
import 'package:weather/utils/text_styles.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

class WeatherBody extends StatefulWidget {
  @override
  _WeatherBodyState createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  final placeController = StandardSearchController();

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
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                print('Current state: $state');
                if (state is WeatherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  return Column(
                    spacing: 20,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<WeatherBloc>()
                                  .add(ChangeDay(day: 'today'));
                            },
                            child: Text('Сегодня'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<WeatherBloc>()
                                  .add(ChangeDay(day: 'tomorrow'));
                            },
                            child: Text('Завтра'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<WeatherBloc>()
                                  .add(ChangeDay(day: 'next7days'));
                            },
                            child: Text('Следующие 7 дней'),
                          ),
                        ],
                      ),
                      state.selectedDay == 'today'
                          ? WeatherToday(
                              city: state.weather.resolvedAddress,
                              datetime: state.weather.days[0]['datetime'],
                              icon: iconDetector(state.weather.days[0]['icon']),
                              description: state.weather.days[0]['conditions'],
                              wind: state.weather.days[0]['windspeed'],
                              humidity: state.weather.days[0]['humidity'],
                              feelslike: state.weather.days[0]['feelslike'],
                              temp: state.weather.days[0]['temp'],
                              precip: state.weather.days[0]['precip'],
                            )
                          : state.selectedDay == 'tomorrow'
                              ? WeatherTomorrow(
                                  city: state.weather.resolvedAddress,
                                  datetime: state.weather.days[1]['datetime'],
                                  icon: iconDetector(
                                      state.weather.days[1]['icon']),
                                  description: state.weather.days[1]
                                      ['conditions'],
                                  wind: state.weather.days[1]['windspeed'],
                                  humidity: state.weather.days[1]['humidity'],
                                  feelslike: state.weather.days[1]['feelslike'],
                                  temp: state.weather.days[1]['temp'],
                                  precip: state.weather.days[1]['precip'],
                                )
                              : state.selectedDay == 'next7days'
                                  ? WeatherForNext7Days(
                                      days: state.weather.days,
                                      city: state.weather.resolvedAddress,
                                    )
                                  : Container(),
                    ],
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Text(
                      'Ohh, it\'s empty here yet',
                      style: TextStyles.defaultStyle,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Color(0xFF4d4f6c),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your city',
                  hintStyle: TextStyles.defaultBottomStyle,
                  icon: Icon(
                    size: 30,
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                controller: placeController,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.read<WeatherBloc>().add(FetchWeather(value));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String removeAfterFirstComma(String input) {
  int commaIndex = input.indexOf(',');
  if (commaIndex != -1) {
    return input.substring(0, commaIndex);
  }
  return input;
}

String iconDetector(String input) {
  switch (input) {
    case 'clear-day':
      return 'assets/svgs/sun-svgrepo-com.svg';
    case 'snow':
      return 'assets/svgs/snowflake-svgrepo-com.svg';
    case 'cloudy':
      return 'assets/svgs/cloudy-svgrepo-com.svg';
    case 'rain':
      return 'assets/svgs/rain-storm-svgrepo-com.svg';
    case 'partly-cloudy-day':
      return 'assets/svgs/cloudy-cloud-svgrepo-com.svg';
    default:
      return 'assets/svgs/planet-earth-maps-and-flags-svgrepo-com.svg';
  }
}
