import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:yabi_test/core/utils/routers/app_routes.dart';
import 'package:yabi_test/core/utils/routers/route_generator.dart';


void main() {
  ///Pre-run configs
  _setupLogging();

  runApp(MyApp());
}

//Logger
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: AppRoutes.dashboard,
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
