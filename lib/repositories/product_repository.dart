import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/services/products_firebase_services.dart';

class ProductRepository {
  ProductRepository(this.productsFirebaseServices);
  final ProductsFirebaseServices productsFirebaseServices;

  Stream<QuerySnapshot> getProducts() async* {
    yield* productsFirebaseServices.getProducts();
  }

  Future<void> addProduct(String title, double price, File file) async {
    return productsFirebaseServices.addProduct(price, title, file);
  }

  Future <void> editProduct() async {}
}
