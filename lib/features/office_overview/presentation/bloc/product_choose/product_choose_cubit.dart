import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';

import '../../../domain/models/service/product.dart';

part 'product_choose_state.dart';

class ServiceChooseCubit extends Cubit<ProductChooseState> {
  ServiceChooseCubit() : super(ProductChooseInitial());

  void getAllProducts(){
    // switch(state){
    //   case
    // }
  }
}
