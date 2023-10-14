import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:more_tech_front/common/logger/logger.dart';
import 'package:more_tech_front/features/office_overview/domain/repositories/offices_repository.dart';

import '../../domain/models/office/office.dart';

part 'office_cubit.freezed.dart';

part 'office_state.dart';

@injectable
class OfficeCubit extends Cubit<OfficeState> {
  OfficeCubit(this._officesRepository) : super(const OfficeState.initial());

  final OfficesRepository _officesRepository;

  Future<void> fetchOffices() async {
    emit(const OfficeState.loading());
    try {
      final offices = await _officesRepository.getOffices();
      emit(
        OfficeState.officesFetched(
          offices: offices,
        ),
      );
    } catch (e, stackTrace) {
      logger.e(
        e,
        stackTrace: stackTrace,
      );
    }
  }

  Iterable<Marker>? get officeMarkers {
    switch (state) {
      case OfficesFetched(:final offices):
        return offices
            .map(
              (e) => Marker(
                markerId: MarkerId(e.id.toString()),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(
                  e.latitude,
                  e.longitude,
                ),
              ),
            );
    }
    return null;
  }
}
