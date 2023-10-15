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

class ProductChooseLoading extends ProductChooseState {}

class ProductChooseRecivedOffices extends ProductChooseAllProducts {
  final Office officeClosest;
  final Office officeFastest;
  final double estimatedTimeClosest;
  final double estimatedTimeFastest;

  ProductChooseRecivedOffices({
    required this.estimatedTimeClosest,
    required this.estimatedTimeFastest,
    required super.products,
    required super.selectedProduct,
    required super.selectedTime,
    required this.officeClosest,
    required this.officeFastest,
  });
}
