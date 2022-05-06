import 'package:advanced/presentation/resources/route_manager.dart';
import 'package:advanced/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const _instance =  MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
