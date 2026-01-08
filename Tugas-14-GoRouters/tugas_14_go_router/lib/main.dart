import 'package:flutter/material.dart';
import 'routes/app_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    ),
  );
}
