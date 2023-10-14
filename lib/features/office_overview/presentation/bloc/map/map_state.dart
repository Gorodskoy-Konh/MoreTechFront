part of 'map_cubit.dart';

@immutable
class MapState {

  final Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();
  
  Future<GoogleMapController> get googleMapController => controllerCompleter.future;

  MapState();
}
