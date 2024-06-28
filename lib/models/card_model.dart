import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';

class CardModel extends ChangeNotifier {
  Product product;
  int amount;
  double totalPrice;
  int id;

  CardModel({
    required this.id,
    required this.product,
    required this.amount,
    required this.totalPrice,
  });
}
