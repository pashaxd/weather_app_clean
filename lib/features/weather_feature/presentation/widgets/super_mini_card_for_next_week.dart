import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/features/weather_feature/presentation/page/weather_body.dart';
import 'package:weather/utils/text_styles.dart';

class SuperMiniCardForNextWeek extends StatelessWidget {
  final String city;
  final String date;
  final double temp;
  final String description;
  final String icon;

  const SuperMiniCardForNextWeek(
      {super.key,
      required this.city,
      required this.date,
      required this.temp,
      required this.description,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(top: 8, left: 10),
        decoration: BoxDecoration(
          color: Color(0xFF4d4f6c),
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.085,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: TextStyles.defaultBottomStyle,
                ),
                Text(date, style: TextStyles.defaultBottomStyle),
                Row(
                  spacing: 5,
                  children: [
                    Text("${temp.round().toString()}°",
                        style: TextStyles.defaultBottomStyle),
                    Text(description, style: TextStyles.defaultBottomStyle)
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 10),
              child: SvgPicture.asset(
                iconDetector(icon),
                width: 50,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
