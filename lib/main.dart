import 'package:flutter/material.dart';
import 'package:task_products/app/production.dart';
import 'package:task_products/core/routes/pages.dart';

void main() async {
  await initAppProduction();
  runApp(AppProductionStartPoint(appRouter: AppRouter()));
}
