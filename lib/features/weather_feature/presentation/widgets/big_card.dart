import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/utils/text_styles.dart';

class BigCard extends StatelessWidget {
  final String city;
  final String date;
  final String temp;
  final String description;
  final String icon;
  const BigCard(
      {super.key,
      required this.city,
      required this.date,
      required this.temp,
      required this.description,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 30, right: 5),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF4d4f6c),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city,
                style: TextStyles.defaultHeadStyle,
              ),
              Text(
                date,
                style: TextStyles.defaultStyle,
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      temp,
                      style: TextStyles.defaultSuperHeadStyle,
                    ),
                    Text(
                      description,
                      style: TextStyles.defaultStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: SvgPicture.asset(icon,
                width: MediaQuery.of(context).size.width * 0.23,
                height: MediaQuery.of(context).size.height * 0.1),
          ),
        ],
      ),
    );
  }
}
