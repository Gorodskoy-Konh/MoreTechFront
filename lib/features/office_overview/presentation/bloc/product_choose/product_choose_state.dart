part of 'product_choose_cubit.dart';

@immutable
abstract class ProductChooseState {}

class ProductChooseInitial extends ProductChooseState {}

class ProductChooseGettingAllProducts extends ProductChooseState {}

class ProductChooseAllProducts extends ProductChooseState {
  final List<Product> products;
  final Product? selectedProduct;
  final TimeOfDay? selectedTime;

  ProductChooseAllProducts({
    this.selectedProduct,
    this.selectedTime,
    required this.products,
  });
}
