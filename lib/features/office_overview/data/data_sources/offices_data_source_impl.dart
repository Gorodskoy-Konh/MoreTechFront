import 'package:dio/dio.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:more_tech_front/common/logger/logger.dart';
import 'package:more_tech_front/features/office_overview/data/data_sources/offices_data_source.dart';
import 'package:more_tech_front/features/office_overview/data/dto/optimal_office_dto.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';
import 'package:more_tech_front/features/office_overview/domain/models/service/product.dart';

import '../../../../common/constants/constants.dart';

@Injectable(as: OfficesDataSource)
class OfficesDataSourceImpl implements OfficesDataSource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      // headers: <String, String>{
      //
      // },
    ),
  );

  @override
  Future<List<Office>?> getOffices(
      [String? city, LatLng? position, int? radius]) async {
    Map<String, dynamic> queryParameters = {};
    if (city != null) {
      queryParameters['city'] = city;
    }
    if (position != null) {
      queryParameters['latitude'] = position.latitude;
      queryParameters['longitude'] = position.longitude;
    }
    if (radius != null) {
      queryParameters['radius'] = radius;
    }
    try {
      final response = await _dio.get(
        kGetOffices,
        queryParameters: queryParameters,
      );
      final List<Office> offices = (response.data as List)
          .map(
            (e) => Office.fromJson(e),
          )
          .toList();
      return offices;
    } on DioError catch (e, stackTrace) {
      logger.e(
        e,
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  @override
  Future<List<Product>?> getAllProducts() async {
    try {
      final response = await _dio.get(kGetAllProducts);
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } on DioError catch (e, stackTrace) {
      logger.e(
        e,
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  @override
  Future<List<OptimalOfficeDto>?> getOptimalOffices(
      Product product, DateTime dateTime, LatLng position, double radius,) async {
    final queryParameters = {
      'product': product.name,
      // TODO - check if the format is appropriate
      'booking_time': dateTime,
      'position': position,
      'radius': radius,
    };
    try {
      final response = await _dio.get(
        kGetOptimalOffices,
        queryParameters: queryParameters,
      );
      final List<OptimalOfficeDto> optimalOfficesDto = (response.data as List)
          .map(
            (e) => OptimalOfficeDto.fromJson(e),
          )
          .toList();

      return optimalOfficesDto;
    } on DioError catch (e, stackTrace) {
      logger.e(
        e,
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  OfficesDataSourceImpl() {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}
