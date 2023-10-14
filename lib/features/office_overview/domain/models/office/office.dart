import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_tech_front/features/office_overview/domain/models/working_hours/working_hours.dart';

part 'office.freezed.dart';

part 'office.g.dart';

@freezed
class Office with _$Office {
  const factory Office({
    required int id,
    required String name,
    required String address,
    required List<WorkingHours> workingHours,
    required double latitude,
    required double longitude,
}) = _Office;

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
}
