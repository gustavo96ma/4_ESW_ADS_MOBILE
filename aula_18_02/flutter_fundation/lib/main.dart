import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  List<Widget> rainbowTexts(String data) {
    final List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.pink,
    ];

    List<Widget> textList = [];

    data.split('').forEach((char) {
      final Random random = Random();
      textList.add(
        Text(
          char,
          style: TextStyle(color: colors[random.nextInt(colors.length)]),
        ),
      );
    });

    return textList;
  }

  @override
  Widget build(BuildContext context) {
    print('executou o método build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
        ),
        body: Container(
          color: Colors.blueGrey,
          child: Center(
            child: Row(
              children: rainbowTexts('Hello World!'),
            ),
          ),
        ),
      ),
    );
  }
}
