import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:more_tech_front/common/constants/constants.dart';

part 'map_state.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  final googleMapPolyline = GoogleMapPolyline(apiKey: kGoogleApiKey);

  Future<void> moveCamera(LatLng target) async {
    final mapController = await state.googleMapController;
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: target,
          zoom: kDefaultMapZoom,
        ),
      ),
    );
  }

  Future<void> buildRoute(
    LatLng origin,
    LatLng destination,
    RouteMode routeMode,
  ) async {
    final points = await googleMapPolyline.getCoordinatesWithLocation(
      origin: origin,
      destination: destination,
      mode: RouteMode.driving,
    );
    assert(points != null);
    final polyline = Polyline(
      polylineId: const PolylineId('polylineId'),
      points: points ?? [],
      width: 4,
      color: Colors.blue,
      startCap: Cap.roundCap,
      endCap: Cap.buttCap,
    );
    emit(
      MapRouteBuilt(
        polyline: polyline,
      ),
    );
  }
}
