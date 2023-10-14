// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    OfficeOverviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OfficeOverviewPage(),
      );
    }
  };
}

/// generated route for
/// [OfficeOverviewPage]
class OfficeOverviewRoute extends PageRouteInfo<void> {
  const OfficeOverviewRoute({List<PageRouteInfo>? children})
      : super(
          OfficeOverviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OfficeOverviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
