import 'package:flutter/material.dart';

const kPrimaryColor = Colors.grey;
final kBgColor = Colors.grey.shade800;
final kBottomBarSelectedTabColor = Colors.grey.shade900;
final kBottomBarUnSelectedTabColor = Colors.grey.shade500;
final kPrimaryButtonColor = Colors.grey.shade800;
final kPrimaryButtonTextColor = Colors.grey.shade100;
final kSearchInputBorderColor = Colors.grey.shade100;
final kSearchInputFocusBorderColor = Colors.grey.shade200;
final kTextColorLight = Colors.grey.shade100;
final kTextColorDark = Colors.grey.shade800;
final kTextColorMedium = Colors.grey.shade500;

final kPrimaryButtonStyle = BoxDecoration(
  color: kPrimaryButtonColor,
  borderRadius: BorderRadius.circular(10),
);

final kSecondaryButtonStyle = kPrimaryButtonStyle.copyWith(
  color: kTextColorLight,
  border: Border.all(color: kTextColorDark),
);
