import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(PlantCareApp());

class PlantCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlantCareApp',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}