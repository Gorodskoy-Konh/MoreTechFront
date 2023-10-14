import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:more_tech_front/features/office_overview/data/data_sources/offices_data_source.dart';
import 'package:more_tech_front/features/office_overview/data/dto/optimal_office_dto.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/domain/models/service/product.dart';
import 'package:more_tech_front/features/office_overview/domain/repositories/offices_repository.dart';

class OfficesRepositoryImpl implements OfficesRepository {
  final OfficesDataSource _dataSource;


  OfficesRepositoryImpl(this._dataSource);

  @override
  Future<List<Office>> getOffices() async {
    return await _dataSource.getOffices() ?? [];
  }

  @override
  Future<List<Product>> getAllProducts() async {
    return await _dataSource.getAllProducts() ?? [];
  }

  @override
  Future<List<OptimalOfficeDto>> getOptimalOffices(Product product, DateTime dateTime, LatLng position, double radius) async {
    return await _dataSource.getOptimalOffices(product, dateTime, position, radius) ?? [];
  }



}