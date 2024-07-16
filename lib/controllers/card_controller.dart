import 'package:flutter/material.dart';
import 'package:online_shop/data/models/card_model.dart';

class CardController extends ChangeNotifier {
  final List<CardModel> _cart = [];
  List<CardModel> get cart {
    return [..._cart];
  }

  void removeFromCard(int index, int id) {
    if (_cart[index].amount == 0) {
      _cart.removeAt(index);
    } else {
      _cart[index].id = index;
      _cart[index].amount--;
    }
    notifyListeners();
    calculatePrice();
  }

  void addToCard(int index, int id) {
    _cart[index].amount++;
    notifyListeners();
    calculatePrice();
  }

  void calculatePrice() {
    double total = 0;
    for (int i = 0; i < _cart.length; i++) {
      total += _cart[i].product.price * _cart[i].amount;
    }
    _cart[0].totalPrice = total;
    notifyListeners();
  }

  bool isProductInCart(int index, int id) {
    return _cart[index].id == 777;
  }
}
