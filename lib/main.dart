import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app/weather_app.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: WeatherApp()));
}
