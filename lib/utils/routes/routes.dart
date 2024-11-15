import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sisal/features/home_page_feature/presentation/home_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
