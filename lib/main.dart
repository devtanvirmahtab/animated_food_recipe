import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'presentation/screens/onbording_screen/onbording_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const OnBoardingPage(),
      theme: mainTheme,
      darkTheme: mainTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
