import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:all_widget/presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: 'buttons',
      builder: (BuildContext context, GoRouterState state) =>
          const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: 'card',
      builder: (BuildContext context, GoRouterState state) =>
          const CardScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: 'progress',
      builder: (BuildContext context, GoRouterState state) =>
          const ProgressScreen(),
    ),
    GoRoute(
      path: '/snack',
      name: 'snack',
      builder: (BuildContext context, GoRouterState state) =>
          const SnackScreen(),
    ),
    GoRoute(
      path: '/control',
      name: 'control',
      builder: (BuildContext context, GoRouterState state) =>
          const ControlScreen(),
    ),
    GoRoute(
      path: '/infinity',
      name: 'infinity',
      builder: (BuildContext context, GoRouterState state) =>
          const InifinityScreen(),
    ),
    GoRoute(
      path: '/counter-screen',
      name: CounterScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const CounterScreen(),
    ),
    GoRoute(
      path: '/change-theme',
      name: ChangeTheme.name,
      builder: (BuildContext context, GoRouterState state) =>
          const ChangeTheme(),
    ),
    GoRoute(
      path: '/formulario',
      name: FormScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const FormScreen(),
    ),
  ],
);
