import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:all_widget/config/router/app_router.dart';
import 'package:all_widget/config/theme/app_theme.dart';
import 'package:all_widget/presentation/providers/theme_provider.dart';
import 'package:all_widget/presentation/screens/button/buttons_screen.dart';
import 'package:all_widget/presentation/screens/card/card_screen.dart';
import 'package:all_widget/presentation/screens/home/home_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final theme = ref.watch(themeProvider);

    final AppTheme appTheme = ref.watch(themNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      title: "Flutter widget",
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      /* home: HomeScreen(),
      routes: {
        "/buttons": (context) => ButtonsScreen(),
        "/cards": (context) => CardScreen()
      },*/
    );
  }
}
