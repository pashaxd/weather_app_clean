import 'package:flutter/material.dart';
import 'package:weather/features/weather_feature/presentation/page/weather_body.dart';

import '../widgets/super_mini_card_for_next_week.dart';

class WeatherForNext7Days extends StatelessWidget {
  final List<dynamic> days;
  final String city;

  const WeatherForNext7Days(
      {super.key, required this.days, required this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return SuperMiniCardForNextWeek(
                city: removeAfterFirstComma(city),
                date: days[index]['datetime'],
                temp: days[index]['temp'],
                description: days[index]['conditions'],
                icon: days[index]['icon'],
              );
            }),
      ),
    );
  }
}
