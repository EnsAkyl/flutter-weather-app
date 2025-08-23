import 'package:flutter/material.dart';

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get home => '/home';

  static String get weather => '/weather';

  static String get location => '/location';

}
