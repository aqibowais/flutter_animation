import 'package:flutter/material.dart';

class Product {
  final Color color;
  final String img;
  Product({
    required this.color,
    required this.img,
  });
}

List<Product> products = [
  Product(
    color: const Color(0xff000000),
    img: 'assets/image1.png',
  ),
  Product(
    color: const Color(0xfffcecd0),
    img: 'assets/image3.png',
  ),
  Product(
    color: const Color(0xffb6d7e4),
    img: 'assets/image2.png',
  ),
];
