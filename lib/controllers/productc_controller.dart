import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/services/products_firebase_services.dart';

class ProductcController extends ChangeNotifier {
  final _productsFirebaseServices = ProductsFirebaseServices();

  Stream<QuerySnapshot> get list async* {
    yield* _productsFirebaseServices.getProducts();
  }

  Future<void> addNewProduct(double price, String title, File file) async {
    await _productsFirebaseServices.addProduct(price, title, file);
  }
}
