import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import './injections.dart' as di;
import 'router.dart';

Future<void> main() async {
  await di.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router  = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    );
  }
}
