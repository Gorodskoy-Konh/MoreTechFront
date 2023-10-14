import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_tech_front/common/auto_route/auto_router.dart';
import 'package:more_tech_front/common/di/di.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/location/location_cubit.dart';
import 'package:more_tech_front/features/office_overview/presentation/bloc/office/office_cubit.dart';

import '../../../app_locale.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<OfficeCubit>()..fetchOffices(),
        ),
        BlocProvider(create: (_) => getIt.get<LocationCubit>()..requestLocation(),),
      ],
      child: MaterialApp.router(
        routerConfig: getIt.get<AppRouter>().config(),
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocale.supportedLocales,
        localizationsDelegates: AppLocale.localizationDelegates,
        title: 'Flutter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
