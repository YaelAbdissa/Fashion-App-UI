import 'package:flutter/material.dart';

import 'screens/core_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff3AA2ED)),
        useMaterial3: true,
        fontFamily: 'Golos',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeNavScreen(),
    );
  }
}
