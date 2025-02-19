import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int counter = 7;

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
      textList.add(
        Text(
          char,
          style: TextStyle(color: colors[(counter % 7)]),
        ),
      );
      counter++;
    });

    return textList;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('executou o método build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
        ),
        body: Container(
          color: Colors.black87,
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rainbowTexts('Hello World! Gustavo é muito legal!!'),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.indigoAccent),
                ),
                onPressed: () {
                  setState(() {
                    final random = Random();
                    counter = random.nextInt(9999);
                  });
                },
                child: Text(
                  'Clique em mim',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
