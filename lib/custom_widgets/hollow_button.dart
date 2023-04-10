import 'package:flutter/material.dart';
import 'package:yabi_test/core/utils/custom_theme_data.dart';

class HollowActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const HollowActionButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: YBColors.btnHollowTextColor,
        backgroundColor: YBColors.btnHollowBackgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: YBColors.btnHollowBorderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12, fontFamily: 'Avenir'),
        minimumSize: const Size(184, 48),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}