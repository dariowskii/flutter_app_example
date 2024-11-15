import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sisal/utils/routes/routes.dart';

class SisalApp extends StatelessWidget {
  const SisalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sisal',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
    );
  }
}

final router = GoRouter(routes: $appRoutes);
