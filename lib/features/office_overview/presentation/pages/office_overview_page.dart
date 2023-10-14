import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/office_cubit.dart';

import '../../../../common/logger/logger.dart';

@RoutePage()
class OfficeOverviewPage extends StatefulWidget {
  const OfficeOverviewPage({super.key});

  @override
  State<OfficeOverviewPage> createState() => _OfficeOverviewPageState();
}

class _OfficeOverviewPageState extends State<OfficeOverviewPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    final officeCubit = context.watch<OfficeCubit>();
    final officeMarkers = officeCubit.officeMarkers ?? [];
    return SafeArea(
      child: Scaffold(
        // body: Placeholder(),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set.from(officeMarkers),
          polylines: Set.from(polyline),
          myLocationEnabled: true,
        ),
      ),
    );
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition();
  }

  Marker _createMarker() {
    return const Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(37.43296265331129, -122.08832357078792),
      icon: BitmapDescriptor.defaultMarker,
    );
  }

  GoogleMapPolyline googleMapPolyline =
      GoogleMapPolyline(apiKey: "AIzaSyDEdr6ih-RBXSKUYx9QDEP-VRRzL8rZC2c");
  final List<Polyline> polyline = [];
  List<LatLng> routeCoords = [];

  computePath() async {
    LatLng origin = LatLng(37.43296265331129, -122.08832357078792);
    LatLng end = LatLng(38.43296265331129, -122.08832357078792);
    routeCoords.addAll((await googleMapPolyline.getCoordinatesWithLocation(
        origin: origin,
        destination: end,
        mode: RouteMode.driving)) as Iterable<LatLng>);

    setState(() {
      polyline.add(Polyline(
          polylineId: PolylineId('iter'),
          visible: true,
          points: routeCoords,
          width: 4,
          color: Colors.blue,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap));
    });
  }
}
