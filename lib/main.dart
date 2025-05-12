import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quest_task/core/app_router/app_routers.dart';
import 'package:quest_task/core/di/setup_service_locator.dart';
import 'package:quest_task/core/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SetupSeviceLocator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder:(context)=> MaterialApp.router(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'Quest Task',
        routerConfig: AppRouter.appRouter,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
