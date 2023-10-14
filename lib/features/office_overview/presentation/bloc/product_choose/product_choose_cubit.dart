import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/service/product.dart';

part 'product_choose_state.dart';

@injectable
class ProductChooseCubit extends Cubit<ProductChooseState> {
  ProductChooseCubit() : super(ProductChooseInitial());

  void getAllProducts(){
    emit(ProductChooseGettingAllProducts());
    //TODO: Request to back for all types of products
    List<Product> products = [];
    emit(ProductChooseAllProducts(products: products));
    // switch(state){
    //   case
    // }
  }
}
