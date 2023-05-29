import 'package:flutter/material.dart';
import 'package:wsafe/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();

  if (await Permission.location.status.isDenied) Permission.location.request();
  if (await Permission.sms.status.isDenied) Permission.sms.request();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
        theme: ThemeData(
            cardColor: Colors.red[100],
            appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: Colors.red)),
            scaffoldBackgroundColor: Colors.red[300],
            inputDecorationTheme: const InputDecorationTheme(
                fillColor: Colors.white54, filled: true)),
        home: const Wrapper());
  }
}
