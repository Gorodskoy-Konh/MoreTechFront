import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_tech_front/features/office_overview/domain/models/office/office.dart';

part 'optimal_office_dto.freezed.dart';
part 'optimal_office_dto.g.dart';

@freezed
class OptimalOfficeDto with _$OptimalOfficeDto {
  const factory OptimalOfficeDto({
    required Office office,
    required double estimatedTime,
}) = _OptimalOfficeDto;

  factory OptimalOfficeDto.fromJson(Map<String, dynamic> json) =>
      _$OptimalOfficeDtoFromJson(json);
}