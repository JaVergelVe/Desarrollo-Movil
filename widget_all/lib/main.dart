import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_all/config/router/app_router.dart';
import 'package:widget_all/config/theme/app_theme.dart';
import 'package:widget_all/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
