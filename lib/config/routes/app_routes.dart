import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/screens.dart';
import 'package:weather_app/screens/weather_screen.dart';
import '../config.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),

  GoRoute(
    path: RouteLocation.weather,
    parentNavigatorKey: navigationKey,
    builder: WeatherScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.location,
    parentNavigatorKey: navigationKey,
    builder: TouristAttractionsScreen.builder,
  ),
];
