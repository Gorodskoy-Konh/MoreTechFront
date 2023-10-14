import 'package:freezed_annotation/freezed_annotation.dart';

part 'working_hours.freezed.dart';

part 'working_hours.g.dart';

@freezed
class WorkingHours with _$WorkingHours {
  const factory WorkingHours({
    DateTime? begin,
    DateTime? end,
    required String day,
  }) = _WorkingHours;

  factory WorkingHours.fromJson(Map<String, dynamic> json) => _$WorkingHoursFromJson(json);
}