import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:litoral_na_mao/app.dart';

void main() {
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }
  runApp(const App());
}
 