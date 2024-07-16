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
    final imageUrl = await _firebaseStorageService.uploadFile(title, file);

    final product = {
      "about": "about this product",
      "aboutTitle": "This is gazal",
      "category": "Category",
      "image": imageUrl,
      "isFav": false,
      "price": price,
      "title": title,
    };

    DocumentReference docRef = await _firebaseFirestore.add(product);

    final updatedProduct = {
      "id": docRef.id,
      "about": "about this product",
      "aboutTitle": "This is gazal",
      "category": "Category",
      "image": imageUrl,
      "isFav": false,
      "price": price,
      "title": title,
    };
    print(docRef.id.toString());

    await _firebaseFirestore.doc(docRef.id.toString()).update(updatedProduct);
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _firebaseFirestore.doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
