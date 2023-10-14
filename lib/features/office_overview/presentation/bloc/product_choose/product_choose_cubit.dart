import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/service/product.dart';

part 'product_choose_state.dart';

@injectable
class ProductChooseCubit extends Cubit<ProductChooseState> {
  ProductChooseCubit() : super(ProductChooseInitial());

  void getAllProducts(){
    // switch(state){
    //   case
    // }
  }
}
