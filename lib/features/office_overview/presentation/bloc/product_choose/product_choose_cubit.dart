import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/service/product.dart';

part 'product_choose_state.dart';

@injectable
class ProductChooseCubit extends Cubit<ProductChooseState> {
  ProductChooseCubit() : super(ProductChooseInitial());

  void getAllProducts() {
    emit(ProductChooseGettingAllProducts());
    //TODO: Request to back for all types of products
    List<Product> products = [Product(name: 'Продукт 1'), Product(name: 'Продукт 2'), Product(name: 'Продукт 3')];
    emit(ProductChooseAllProducts(products: products));
    // switch(state){
    //   case
    // }
  }

  void selectProduct(Product selectedProduct) {
    switch (state) {
      case ProductChooseAllProducts state:
        emit(
          ProductChooseAllProducts(
            products: state.products,
            selectedProduct: selectedProduct,
            selectedTime: state.selectedTime,
          ),
        );
    }
  }

  void selectTime(TimeOfDay time) {
    switch (state) {
      case ProductChooseAllProducts state:
        emit(
          ProductChooseAllProducts(
            products: state.products,
            selectedProduct: state.selectedProduct,
            selectedTime: time,
          ),
        );
    }
  }
}
