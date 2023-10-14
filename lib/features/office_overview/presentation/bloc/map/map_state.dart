part of 'map_cubit.dart';

@immutable
sealed class MapState {
  final Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();

  Future<GoogleMapController> get googleMapController =>
      controllerCompleter.future;

  MapState();
}

class MapInitial extends MapState {}

class MapRouteBuilt extends MapState {
  final Polyline polyline;

  MapRouteBuilt({required this.polyline,});
}
