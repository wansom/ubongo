import 'package:flutter/material.dart';
import 'package:ubongo/common/constants/route_constants.dart';
import 'package:ubongo/presentation/journey/dashboard/dashboard_screen.dart';



class DashboardRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.dashbaord: (context) => const DashboardScreen(),
    };
  }
}
