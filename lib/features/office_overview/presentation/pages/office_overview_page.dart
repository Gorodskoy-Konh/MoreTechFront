import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/location/location_cubit.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/map/map_cubit.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/office/office_cubit.dart';

@RoutePage()
class OfficeOverviewPage extends StatefulWidget {
  const OfficeOverviewPage({super.key});

  @override
  State<OfficeOverviewPage> createState() => _OfficeOverviewPageState();
}

class _OfficeOverviewPageState extends State<OfficeOverviewPage> {

  @override
  Widget build(BuildContext context) {
    final officeState = context.watch<OfficeCubit>().state;
    final locationState = context.watch<LocationCubit>().state;
    final mapState = context.watch<MapCubit>().state;
    return SafeArea(
      child: Scaffold(
        // body: Placeholder(),
        body: BlocListener<LocationCubit, LocationState>(
          listener: (context, state) {
            switch (state) {
              case LocationPermissionGranted locationState:
                context.read<MapCubit>().moveCamera(
                      locationState.latLng,
                    );
                break;
              default:
                break;
            }
          },
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LocationState.defaultLocation,
              zoom: 10.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              context
                  .read<MapCubit>()
                  .state
                  .controllerCompleter
                  .complete(controller);
            },
            markers: Set.from(
              switch (officeState) {
                OfficeFetched(:final officeMarkers) => officeMarkers,
                _ => const Iterable.empty(),
              },
            ),
            polylines: Set.from(polyline),
            myLocationEnabled: true,
          ),
        ),
      ),
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

    setState(
      () {
        polyline.add(
          Polyline(
            polylineId: PolylineId('iter'),
            visible: true,
            points: routeCoords,
            width: 4,
            color: Colors.blue,
            startCap: Cap.roundCap,
            endCap: Cap.buttCap,
          ),
        );
      },
    );
  }
}
