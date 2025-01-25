import 'package:flutter/material.dart';

import 'package:weather/features/weather_feature/presentation/page/weather_body.dart';

import '../widgets/big_card.dart';
import '../widgets/mini_card.dart';

class WeatherToday extends StatefulWidget {
  final String city;
  final String datetime;
  final double temp;
  final String description;
  final String icon;
  final double feelslike;
  final double humidity;
  final double wind;
  final double precip;

  const WeatherToday({
    required this.city,
    required this.datetime,
    required this.icon,
    required this.description,
    required this.wind,
    required this.humidity,
    required this.feelslike,
    required this.temp,
    required this.precip,
    super.key,
  });

  @override
  State<WeatherToday> createState() => _WeatherTodayState();
}

class _WeatherTodayState extends State<WeatherToday> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      children: [
        BigCard(
          city: removeAfterFirstComma(widget.city),
          date: widget.datetime,
          temp: '${widget.temp.round()}°',
          description: removeAfterFirstComma(widget.description),
          icon: widget.icon,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              spacing: 30,
              children: [
                MiniCard(
                  name: 'Feels like',
                  description: "${widget.feelslike.round()}°",
                ),
                MiniCard(
                  name: 'Humidity',
                  description: "${widget.humidity.round()}%",
                ),
              ],
            ),
            Column(
              spacing: 30,
              children: [
                MiniCard(
                  name: 'Wind',
                  description: "${widget.wind.round()} km/h",
                ),
                MiniCard(
                  name: 'Precipitation',
                  description: "${widget.precip.round()} mm",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
