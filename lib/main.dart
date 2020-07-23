import 'package:flutter/material.dart';
import 'package:video_streaming_mockup/ui/app_screen.dart';

void main() {
  runApp(MyApp());
}

// https://i.insider.com/5e8f427ac023204234683226?width=1100&format=jpeg&auto=webpw
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconTheme.of(context).copyWith(color: Colors.white70),
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppScreen(),
    );
  }
}

