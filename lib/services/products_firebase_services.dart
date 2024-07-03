import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/services/firebase_storage_service.dart';

class ProductsFirebaseServices {
  final _firebaseFirestore = FirebaseFirestore.instance.collection("products");
  final _firebaseStorageService = FirebaseStorageService();
  Stream<QuerySnapshot> getProducts() async* {
    yield* _firebaseFirestore.snapshots();
  }

  Future<void> addProduct(double price, String title, File file) async {
    final imageUrl = _firebaseStorageService.uploadFile(title, file);
    await _firebaseFirestore.add(
      {
        "about": "about this product",
        "aboutTitle": "This is gazal",
        "category": "Category",
        "image": imageUrl,
        "isFav": false,
        "price": price,
        "title": title,
      },
    );
  }
}
