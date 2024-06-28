import 'package:flutter/material.dart';
import 'package:online_shop/models/card_model.dart';
import 'package:online_shop/models/product.dart';

class CardController extends ChangeNotifier {
  final List<CardModel> _cart = [
    CardModel(
      id: 777,
      product: Product(
        title: "Table Lamp",
        category: "Lamp",
        price: 142,
        image:
            "https://t3.ftcdn.net/jpg/01/29/34/86/360_F_129348648_LVz3BBzbw67eC8r8z1Sa1IVW1Y9bw8a8.jpg",
        isFav: true,
        about:
            "Table lamps offer a soft, warm glow that can create a cozy and inviting atmosphere in any room. Whether you're looking to create a relaxing reading nook or want to add some mood lighting to your living room, a table lamp can help you achieve the perfect ambiance.",
        aboutTitle: "Simple & Minimalist Lights",
      ),
      amount: 0,
      totalPrice: 0,
    ),
  ];
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
