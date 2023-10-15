part of 'map_cubit.dart';

 class MapState {
  final Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();

  GoogleMapController? controller;



  Future<GoogleMapController> get googleMapController =>
      controllerCompleter.future;

  MapState();
}
