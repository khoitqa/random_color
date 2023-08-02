//A Project make by KoiTran 02/08/2023

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color bgColor = Colors.white;
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Random Color Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Random Color"),
          ),
          body: GestureDetector(
            onTap: onTapBackground,
            child: Container(
              color: bgColor,
              alignment: Alignment.center,
              child: Text(
                "Hello There",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: onChangingText,
            child: const Icon(Icons.text_fields),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  void onTapBackground() {
    setState(() {
      bgColor = getRandom(bgColor);
    });
  }

  void onChangingText() {
    setState(() {
      textColor = getRandom(textColor);
    });
  }

  Color getRandom(Color color) {
    Color randomColor = getRandomColorByRandomRGB();
    while (color == randomColor) {
      randomColor = getRandomColorByRandomRGB();
    }
    return randomColor;
  }

  Color getRandomColorByRandomRGB() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    return Color.fromRGBO(red, green, blue, 1.0);
  }
}
