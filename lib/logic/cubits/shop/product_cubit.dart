import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:online_shop/logic/cubits/shop/product_state.dart';
import 'package:online_shop/repositories/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepository) : super(InitialProductState());

  final ProductRepository productRepository;

  void getProducts() async {
    emit(LoadingProductState());
    try {
      final products = productRepository.getProducts();
      emit(
        LoadedProductState(products),
      );
    } catch (e) {
      emit(
        ErrorProductState(
          e.toString(),
        ),
      );
    }
  }

  void addProduct(
    String title,
    double price,
    File file,
  ) async {
    final existingProducts = (state as LoadedProductState).products;

    try {
      emit(
        LoadingProductState(),
      );
      // final product = await productRepository.addProduct(
      //   title,
      //   price,
      //   file,
      // );

      emit(LoadedProductState(existingProducts));
    } catch (e) {
      emit(
        ErrorProductState(e.toString()),
      );
    }
  }

  // void editProduct() async{
  //   final ex
  //   try{
  //     emit(LoadingProductState(),);
  //     emit(LoadedProductState(products))
  //   }
  // }
}
