import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:more_tech_front/common/logger/logger.dart';
import 'package:more_tech_front/features/office_overview/domain/repositories/offices_repository.dart';

import '../../../domain/models/office/office.dart';

part 'office_state.dart';

@injectable
class OfficeCubit extends Cubit<OfficeState> {
  OfficeCubit(this._officesRepository) : super(const OfficeInitial());

  final OfficesRepository _officesRepository;

  void selectOffice(Office office) {
    switch (state) {
      case OfficeFetched state:
        emit(
          OfficeFetched(
            offices: state.offices,
            selectedOffice: office,
          ),
        );
        return;
      default:
        return;
    }
  }

  Future<void> fetchOffices() async {
    emit(const OfficeLoading());
    try {
      final offices = await _officesRepository.getOffices();
      emit(
        OfficeFetched(
          offices: offices,
        ),
      );
    } catch (e, stackTrace) {
      logger.e(
        e,
        stackTrace: stackTrace,
      );
      emit(OfficeError(e.toString()));
    }
  }
}
