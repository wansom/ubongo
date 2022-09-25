import 'package:flutter/material.dart';
import 'package:ubongo/presentation/journey/video/videos_routes.dart';


import 'journey/dashboard/dashboard_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> _getCombinedRoutes() => {
        ...DashboardRoutes.getAll(),
        ...VideoRoutes.getAll(),
      };

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}
