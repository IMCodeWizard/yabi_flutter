import 'package:flutter/material.dart';


class YBColors {
  const YBColors();

  //Main
  static const Color mainBackgroundColor = Color(0xFFF5F5F5);
  static const Color appBarTitleColor = Color(0xFF363C50);
  static const Color appBarBackgroundColor = Color(0xFF2E2F45);

  //TextFormField
  static const Color txtFieldUnderlineInputBorderColor = Color(0xFF9578D3);

  //Spinner
  static const Color spinnerColor = Color(0xFF9578D3);

  ///Buttons
  //Basic buttons
  static const Color btnBasicTextColor = Color(0xFFFEFEFE);
  static const Color btnBasicBackgroundColor = Color(0xFF9578D3);
  static const Color btnBasicIconColor = Color(0xFF9578D3);

  //Hollow buttons
  static const Color btnHollowTextColor = Color(0xFF9578D3);
  static const Color btnHollowBackgroundColor = Color(0xFFFEFEFE);
  static const Color btnHollowIconColor = Color(0xFF9578D3);
  static const Color btnHollowBorderColor = Color(0xFF9578D3);

  //Dialog buttons
  static const Color cancelDialogButtonColor = Color(0xFF9578D3);
  static const Color confirmDialogButtonColor = Color(0xFF363C50);
}

class CustomTextStyle {
  static const TextStyle mainDetailsTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: 'Avenir',
    fontSize: 18,
  );

  static const TextStyle valueDetailsTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: 'Avenir',
    fontSize: 16,
  );

  static const TextStyle hintDetailsTextStyle = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      fontFamily: 'Avenir'
  );


  static const TextStyle cancelDialogButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: 'Avenir',
    fontSize: 16,
    color: YBColors.cancelDialogButtonColor,
  );

  static const TextStyle confirmDialogButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: 'Avenir',
    fontSize: 16,
    color: YBColors.confirmDialogButtonColor,
  );
}
