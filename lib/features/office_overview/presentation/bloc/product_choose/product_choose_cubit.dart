import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/domain/repositories/offices_repository.dart';

import '../../../domain/models/service/product.dart';

part 'product_choose_state.dart';

@injectable
class ProductChooseCubit extends Cubit<ProductChooseState> {
  ProductChooseCubit({required this.officesRepository})
      : super(ProductChooseInitial());

  final OfficesRepository officesRepository;

  void getAllProducts() {
    emit(ProductChooseGettingAllProducts());
    //TODO: Request to back for all types of products
    List<Product> products = [
      Product(name: 'Продукт 1'),
      Product(name: 'Продукт 2'),
      Product(name: 'Продукт 3')
    ];
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

  Future<void> getOptimalOffices(LatLng position, double radius) async {
    switch (state) {
      case ProductChooseAllProducts state:
        emit(ProductChooseLoading());
        final DateTime dateTime = DateTime.now().copyWith(
            hour: state.selectedTime!.hour, minute: state.selectedTime!.minute);
        // The first one is FASTEST and the second one is CLOSEST
        final result = await officesRepository.getOptimalOffices(
            state.selectedProduct!, dateTime, position, radius);
        emit(ProductChooseRecivedOffices(
          estimatedTimeClosest: result[1].estimatedTime,
          estimatedTimeFastest: result[0].estimatedTime,
          products: state.products,
          selectedProduct: state.selectedProduct,
          selectedTime: state.selectedTime,
          officeClosest: result[1].office,
          officeFastest: result[0].office,
        ));
    }
  }
}
