import 'package:flutter/material.dart';
import 'package:weather/utils/text_styles.dart';

class MiniCard extends StatelessWidget {
  final String name;
  final String description;
  const MiniCard({super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFF4d4f6c), borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyles.defaultBottomStyle,
          ),
          Text(
            description,
            style: TextStyles.defaultBottom2Style,
          )
        ],
      ),
    );
  }
}
