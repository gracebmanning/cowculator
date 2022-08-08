import 'package:flutter/material.dart';

const pink = Color.fromARGB(255, 251, 174, 208); // 0
const blue = Color.fromARGB(255, 184, 229, 255); // 1
const green = Color.fromARGB(255, 115, 202, 143); // 2
const yellow = Color.fromARGB(220, 252, 227, 97); // 3
const brown = Color.fromARGB(200, 138, 79, 25); // 4
const black = Color.fromARGB(210, 0, 0, 0); // 5
const white = Colors.white; // 6

Map<Color, Color> transparents = {
  pink: const Color.fromARGB(30, 251, 174, 208),
  blue: const Color.fromARGB(45, 184, 229, 255),
  green: const Color.fromARGB(30, 115, 202, 143),
  yellow: const Color.fromARGB(45, 252, 227, 97),
  brown: const Color.fromARGB(25, 138, 79, 25),
  black: const Color.fromARGB(25, 0, 0, 0)
};

Map<Color, int> colorsToNumbers = {
  pink: 0,
  blue: 1,
  green: 2,
  yellow: 3,
  brown: 4,
  black: 5,
  white: 6
};

Map<int, Color> numbersToColors = {
  0: pink,
  1: blue,
  2: green,
  3: yellow,
  4: brown,
  5: black,
  6: white
};
