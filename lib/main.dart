import 'package:flutter/material.dart';
import 'package:ets/src/pages/movie_details.dart';
import 'package:ets/src/pages/movies_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieList(),
    );
  }
}
