part of 'product_choose_cubit.dart';

@immutable
abstract class ProductChooseState {}

class ProductChooseInitial extends ProductChooseState {}

class ProductChooseGettingAllProducts extends ProductChooseState {}

class ProductChooseAllProducts extends ProductChooseState {
  final List<Product> products;

  ProductChooseAllProducts({required this.products});
}

class ProductChooseLoading extends ProductChooseState{
  final int productIndex;
  final List<Product> products;

  ProductChooseLoading({required this.products, required this.productIndex});
}

class ProductChooseLoaded extends ProductChooseState{
  final int productIndex;
  final List<Product> products;
  final List<Office> offices;

  ProductChooseLoaded({required this.products, required this.productIndex, required this.offices});
}
