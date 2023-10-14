import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/office/office.dart';

part 'optimal_office_state.dart';

class OptimalOfficeCubit extends Cubit<OptimalOfficeState> {
  OptimalOfficeCubit() : super(OptimalOfficeInitial());

  void findOffice(){
    switch(state){
      case OptimalOfficeInitial state:
        emit(OptimalOfficeLoading());
        //TODO: тут нужжно короче получить маршрут
        emit(OptimalOfficeFound(optimalOffices: []));
        return;
      default:
        return;
    }
  }

  void returnInitial(){
    emit(OptimalOfficeInitial());
    return;
  }
}

