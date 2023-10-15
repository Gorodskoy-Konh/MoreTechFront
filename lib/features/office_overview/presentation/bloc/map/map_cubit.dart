import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:more_tech_front/common/constants/constants.dart';

import '../../../../../common/logger/logger.dart';

part 'map_state.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState());



  Future<void> moveCamera(LatLng target) async {
    logger.t('MOVE CAMERA TO ${target}');
    // final mapController = await state.googleMapController;
    final mapController = state.controller;
    await mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: target,
          zoom: kDefaultMapZoom,
        ),
      ),
    );
  }

  void removeRoute() {
  }


}
