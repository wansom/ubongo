import 'package:flutter/material.dart';
import 'package:ubongo/common/injector/injector_config.dart';
import 'package:ubongo/presentation/app.dart';

import 'common/utils/database_util.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InjectorConfig.setup();
  await DatabaseUtil.initDatabase();

  runApp(const App());
}
