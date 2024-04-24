import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Siksa Kubur',
      theme: ThemeData(
        primaryColor: Colors.grey[900], // Dark blue background color
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ImageDescriptionPage(),
    );
  }
}

class ImageDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siksa Kubur'),
      ),
      body: Container(
        color: Colors.grey[900], // Dark blue background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://www.voicemagz.com/wp-content/uploads/2024/02/Film-Siksa-Kubur-Poster.jpg', // Image path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Siksa Kubur (2024)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Grave Torture (Indonesian: Siksa Kubur) is a 2024 Indonesian psychological horror film written and directed by Joko Anwar. The film is based on Anwar\'s 2012 short film of the same name. The film stars Faradina Mufti, Reza Rahadian, Christine Hakim and Slamet Rahardjo.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
