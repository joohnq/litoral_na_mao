import 'package:flutter/material.dart';
import 'package:litoral_na_mao/app.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const App());
}
