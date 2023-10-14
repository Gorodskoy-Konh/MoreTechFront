import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:more_tech_front/features/office_overview/data/dto/optimal_office_dto.dart';

import '../../domain/models/office/office.dart';
import '../../domain/models/service/product.dart';

abstract class OfficesDataSource {
  Future<List<Office>?> getOffices([String? city, LatLng? position, int? radius]);

  Future<List<Product>?> getAllProducts();

  Future<List<OptimalOfficeDto>?> getOptimalOffices(
    Product product,
    DateTime dateTime,
    LatLng position,
    double radius,
  );
}
