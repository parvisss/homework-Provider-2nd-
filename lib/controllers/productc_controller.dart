import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';

class ProductcController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
        title: "Table Lamp",
        category: "Lamp",
        price: 142,
        image:
            "https://t3.ftcdn.net/jpg/01/29/34/86/360_F_129348648_LVz3BBzbw67eC8r8z1Sa1IVW1Y9bw8a8.jpg",
        isFav: true,
        about:
            "Table lamps offer a soft, warm glow that can create a cozy and inviting atmosphere in any room. Whether you're looking to create a relaxing reading nook or want to add some mood lighting to your living room, a table lamp can help you achieve the perfect ambiance.",
        aboutTitle: "Simple & Minimalist Lights"),
  ];

  List<Product> get list {
    return [..._list];
  }
}
