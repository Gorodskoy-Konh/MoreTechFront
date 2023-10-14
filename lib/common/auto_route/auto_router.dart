import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/office_overview/presentation/pages/office_overview_page.dart';

part 'auto_router.gr.dart';

@Singleton()
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: OfficeOverviewRoute.page,
          initial: true,
        ),
        // AutoRoute(
        //   // initial: true,
        //   path: '/choose_gender',
        //   page: ChooseGenderRoute.page,
        // ),
      ];
}
