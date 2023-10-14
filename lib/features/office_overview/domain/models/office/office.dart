import 'package:freezed_annotation/freezed_annotation.dart';

part 'office.freezed.dart';

part 'office.g.dart';

@freezed
class Office with _$Office {
  const factory Office({
    required int id,
    required String name,
    required String address,
    required String workingHours,
    required double latitude,
    required double longitude,
}) = _Office;

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
}
