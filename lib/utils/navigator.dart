import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigate(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
