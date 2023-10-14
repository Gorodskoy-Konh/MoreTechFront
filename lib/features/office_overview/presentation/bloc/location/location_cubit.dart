import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationInitial());

  Future<void> requestLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const LocationError('Location is off'));
      return;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        emit(
          const LocationError('Location permissions are denied'),
        );
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      emit(
        const LocationError(
            'Location permissions are permanently denied, we cannot request permissions.'),
      );
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    emit(
      LocationPermissionGranted(
        currentPosition: position,
      ),
    );
  }

  Future<void> updateCurrentPosition() async {
    switch (state) {
      case LocationPermissionGranted():
        final position = await Geolocator.getCurrentPosition();
        return emit(
          LocationPermissionGranted(
            currentPosition: position,
          ),
        );
      default:
        return;
    }
  }
}
