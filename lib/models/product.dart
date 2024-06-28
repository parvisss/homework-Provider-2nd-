import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  String title;
  String category;
  double price;
  bool isFav;
  String image;
  String about;
  String aboutTitle;
  Product({
    required this.title,
    required this.category,
    required this.price,
    required this.image,
    required this.isFav,
    required this.about,
    required this.aboutTitle,
  });
}
