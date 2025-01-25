import 'package:flutter/material.dart';
import 'package:weather/utils/text_styles.dart';

class TextButtons extends StatefulWidget {
  final Function onTap;
  final String text;
  const TextButtons({super.key, required this.onTap, required this.text});

  @override
  State<TextButtons> createState() => _TextButtonsState();
}

class _TextButtonsState extends State<TextButtons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap(),
      child: Text(
        widget.text,
        style: TextStyles.defaultBottomStyle,
      ),
    );
  }
}
