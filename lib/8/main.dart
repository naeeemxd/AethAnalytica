
// main.dart
import 'package:aeth_analatica/8/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      home: HomeScreen(),
      routes: {
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
