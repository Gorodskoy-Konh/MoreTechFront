// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/office_overview/data/data_sources/offices_data_source.dart'
    as _i6;
import '../../features/office_overview/data/data_sources/offices_data_source_impl.dart'
    as _i7;
import '../../features/office_overview/data/repositories/offices_repository_mock.dart'
    as _i9;
import '../../features/office_overview/domain/repositories/offices_repository.dart'
    as _i8;
import '../../features/office_overview/presentation/bloc/location/location_cubit.dart'
    as _i4;
import '../../features/office_overview/presentation/bloc/map/map_cubit.dart'
    as _i5;
import '../../features/office_overview/presentation/bloc/office/office_cubit.dart'
    as _i12;
import '../../features/office_overview/presentation/bloc/optimal_office/optimal_office_cubit.dart'
    as _i10;
import '../../features/office_overview/presentation/bloc/product_choose/product_choose_cubit.dart'
    as _i11;
import '../auto_route/auto_router.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.factory<_i4.LocationCubit>(() => _i4.LocationCubit());
    gh.factory<_i5.MapCubit>(() => _i5.MapCubit());
    gh.factory<_i6.OfficesDataSource>(() => _i7.OfficesDataSourceImpl());
    gh.factory<_i8.OfficesRepository>(() => _i9.OfficesRepositoryMock());
    gh.factory<_i10.OptimalOfficeCubit>(() => _i10.OptimalOfficeCubit());
    gh.factory<_i11.ProductChooseCubit>(() => _i11.ProductChooseCubit());
    gh.factory<_i12.OfficeCubit>(
        () => _i12.OfficeCubit(gh<_i8.OfficesRepository>()));
    return this;
  }
}
