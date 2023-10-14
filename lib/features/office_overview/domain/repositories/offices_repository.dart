import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';

abstract class OfficesRepository {
  Future<List<Office>> getOffices();
}
