part of 'office_cubit.dart';

@freezed
class OfficeState with _$OfficeState {
  const factory OfficeState.initial() = Initial;

  const factory OfficeState.loading() = Loading;

  const factory OfficeState.officesFetched({
    required List<Office> offices,
  }) = OfficesFetched;
}
