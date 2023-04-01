import 'package:flutter/material.dart';

import 'imco.dart';

void main() {
  runApp(MaterialApp(
    home: imc(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(hintColor: Colors.green, primaryColor: Colors.white),
  ));
}
