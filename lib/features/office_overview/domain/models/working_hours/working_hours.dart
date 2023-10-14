import 'package:freezed_annotation/freezed_annotation.dart';

part 'working_hours.freezed.dart';

part 'working_hours.g.dart';

@freezed
class WorkingHours with _$WorkingHours {
  const factory WorkingHours({
    required String begin,
    required String end,
    required String day,
  }) = _WorkingHours;

  factory WorkingHours.fromJson(Map<String, dynamic> json) => _$WorkingHoursFromJson(json);
}
