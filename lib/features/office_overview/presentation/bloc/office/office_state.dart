part of 'office_cubit.dart';

@immutable
sealed class OfficeState {
  const OfficeState();
}

class OfficeInitial extends OfficeState {
  const OfficeInitial();
}

class OfficeLoading extends OfficeState {
  const OfficeLoading();
}

class OfficeError extends OfficeState {
  final String message;

  const OfficeError([
    this.message = '',
  ]);
}

class OfficeFetched extends OfficeState {
  final List<Office> offices;

  const OfficeFetched({
    required this.offices,
  });

  Iterable<Marker> get officeMarkers => offices.map(
        (e) => Marker(
          markerId: MarkerId(e.id.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(
            e.latitude,
            e.longitude,
          ),
          onTap: () {
            logger.t('Marker ${e.id} pressed');
          },
        ),
      );
}
