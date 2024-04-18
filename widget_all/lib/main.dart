import 'package:flutter/material.dart';
import 'package:widget_all/config/router/app_router.dart';
import 'package:widget_all/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: "Flutter widget",
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      /* home: HomeScreen(),
      routes: {
        "/buttons": (context) => ButtonsScreen(),
        "/cards": (context) => CardScreen()
      },*/
    );
  }
}
