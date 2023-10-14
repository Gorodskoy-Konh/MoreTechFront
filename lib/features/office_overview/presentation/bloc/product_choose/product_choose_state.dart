part of 'product_choose_cubit.dart';

@immutable
abstract class ProductChooseState {}

class ProductChooseInitial extends ProductChooseState {}

class ProductChooseGettingAllProducts extends ProductChooseState {}

class ProductChooseAllProducts extends ProductChooseState {
  final List<Product> products;
  final int index;

  ProductChooseAllProducts({
    this.index = 0,
    required this.products,
  });
}
