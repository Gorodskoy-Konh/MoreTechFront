import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';

import '../../data/dto/optimal_office_dto.dart';
import '../models/service/product.dart';

abstract class OfficesRepository {
  Future<List<Office>> getOffices();

  Future<List<Product>> getAllProducts();

  Future<List<OptimalOfficeDto>> getOptimalOffices(
      Product product,
      DateTime dateTime,
      LatLng position,
      double radius,
      );
}
