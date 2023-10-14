import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/domain/models/working_hours/working_hours.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/location/location_cubit.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/map/map_cubit.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/office/office_cubit.dart';
import 'package:more_tech_front/features/office_overview/presentation/widgets/office_bottom_tile.dart';

import '../../../../common/constants/constants.dart';

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
    final officeMarkers = switch (officeState) {
      OfficeFetched(:final officeMarkers) => officeMarkers.toList(),
      _ => <Marker>[],
    };
    final currentLocation = switch (locationState) {
      LocationPermissionGranted locationState => locationState.latLng,
      _ => null,
    };
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
          child: Stack(
            fit: StackFit.expand,
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: kDefaultCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  context
                      .read<MapCubit>()
                      .state
                      .controllerCompleter
                      .complete(controller);
                },
                markers: Set.from(officeMarkers),
                polylines: switch (mapState) {
                  MapRouteBuilt mapState => {mapState.polyline},
                  _ => const {},
                },
                myLocationEnabled: true,
              ),
              Positioned(
                bottom: 50,
                left: 30,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    context.read<MapCubit>().buildRoute(
                          currentLocation!,
                          officeMarkers[0].position,
                          RouteMode.driving,
                        );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height / 3,
                child: OfficeBottomTile(
                  scrollController: ScrollController(),
                  office: Office(
                    id: 1,
                    name: 'ДО «Солнечногорский» Филиала № 7701 Банка ВТБ (ПАО)',
                    address: 'ул. Красная, д. 60',
                    workingHours: [
                      WorkingHours(begin: '9:00', end: '18:00', day: 'ПН'),
                      WorkingHours(begin: '9:00', end: '18:00', day: 'ВТ'),
                      WorkingHours(begin: '9:00', end: '18:00', day: 'СР'),
                      WorkingHours(begin: '9:00', end: '18:00', day: 'ЧТ'),
                      WorkingHours(begin: '9:00', end: '18:00', day: 'ПТ'),
                      WorkingHours(begin: '9:00', end: '18:00', day: 'СБ'),
                      WorkingHours(begin: '', end: '', day: 'ВС'),
                    ],
                    latitude: 0,
                    longitude: 0,
                  ),
                ),
              ),
            ],
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
    routeCoords.addAll(
      (
        await googleMapPolyline.getCoordinatesWithLocation(
          origin: origin,
          destination: end,
          mode: RouteMode.driving,
        ),
      ) as Iterable<LatLng>,
    );

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
