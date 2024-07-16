import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String id;
  String title;
  String category;
  double price;
  bool isFav;
  String image;
  String about;
  String aboutTitle;
  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.image,
    required this.isFav,
    required this.about,
    required this.aboutTitle,
  });
  factory Product.fromMap(QueryDocumentSnapshot map) {
    return Product(
      id: map.id,
      title: map['title'],
      category: map['category'],
      price: map['price'].toDouble(),
      image: map['image'],
      isFav: map['isFav'],
      about: map['about'],
      aboutTitle: map['aboutTitle'],
    );
  }
}
