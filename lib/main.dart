import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sisal/features/sisal_app_feature/presentation/sisal_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: SisalApp(),
    ),
  );
}
