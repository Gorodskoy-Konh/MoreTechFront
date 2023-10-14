part of 'location_cubit.dart';

@immutable
sealed class LocationState {
  const LocationState();

  static const LatLng defaultLocation = LatLng(55.753927, 37.620531);
}

class LocationInitial extends LocationState {
  const LocationInitial();
}

class LocationPermissionRequested extends LocationState {
  const LocationPermissionRequested();
}

class LocationPermissionGranted extends LocationState {
  const LocationPermissionGranted({
    required this.currentPosition,
  });

  final Position currentPosition;

  LatLng get latLng => LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      );
}

class LocationPermissionNotGranted extends LocationState {
  const LocationPermissionNotGranted();
}

class LocationLoading extends LocationState {
  const LocationLoading();
}

class LocationError extends LocationState {
  const LocationError([
    this.message = '',
  ]);

  final String message;
}
