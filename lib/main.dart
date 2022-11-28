import 'package:flutter/material.dart';
import 'package:sixth_project/providers/simple_interest_provider.dart';

import 'screens/calculator_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.purple)),
      title: 'Simple Interest Calculator',
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => SiProvider(),
        ),
      ], child: const CalculatorScreen()),
    );
  }
}
