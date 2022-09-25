import 'package:flutter/material.dart';
import 'package:ubongo/common/constants/route_constants.dart';
import 'package:ubongo/presentation/routes.dart';
import 'package:ubongo/presentation/themes/theme_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubongo Kids',
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      routes: Routes.getAll(),
      initialRoute: RouteList.dashbaord,
    );
  }
}
