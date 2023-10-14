// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'office.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return _Office.fromJson(json);
}

/// @nodoc
mixin _$Office {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<WorkingHours> get workingHours => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeCopyWith<Office> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeCopyWith<$Res> {
  factory $OfficeCopyWith(Office value, $Res Function(Office) then) =
      _$OfficeCopyWithImpl<$Res, Office>;
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      List<WorkingHours> workingHours,
      double latitude,
      double longitude});
}

/// @nodoc
class _$OfficeCopyWithImpl<$Res, $Val extends Office>
    implements $OfficeCopyWith<$Res> {
  _$OfficeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? workingHours = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      workingHours: null == workingHours
          ? _value.workingHours
          : workingHours // ignore: cast_nullable_to_non_nullable
              as List<WorkingHours>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficeImplCopyWith<$Res> implements $OfficeCopyWith<$Res> {
  factory _$$OfficeImplCopyWith(
          _$OfficeImpl value, $Res Function(_$OfficeImpl) then) =
      __$$OfficeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      List<WorkingHours> workingHours,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$OfficeImplCopyWithImpl<$Res>
    extends _$OfficeCopyWithImpl<$Res, _$OfficeImpl>
    implements _$$OfficeImplCopyWith<$Res> {
  __$$OfficeImplCopyWithImpl(
      _$OfficeImpl _value, $Res Function(_$OfficeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? workingHours = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$OfficeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      workingHours: null == workingHours
          ? _value._workingHours
          : workingHours // ignore: cast_nullable_to_non_nullable
              as List<WorkingHours>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeImpl implements _Office {
  const _$OfficeImpl(
      {required this.id,
      required this.name,
      required this.address,
      required final List<WorkingHours> workingHours,
      required this.latitude,
      required this.longitude})
      : _workingHours = workingHours;

  factory _$OfficeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  final List<WorkingHours> _workingHours;
  @override
  List<WorkingHours> get workingHours {
    if (_workingHours is EqualUnmodifiableListView) return _workingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workingHours);
  }

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'Office(id: $id, name: $name, address: $address, workingHours: $workingHours, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._workingHours, _workingHours) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address,
      const DeepCollectionEquality().hash(_workingHours), latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeImplCopyWith<_$OfficeImpl> get copyWith =>
      __$$OfficeImplCopyWithImpl<_$OfficeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeImplToJson(
      this,
    );
  }
}

abstract class _Office implements Office {
  const factory _Office(
      {required final int id,
      required final String name,
      required final String address,
      required final List<WorkingHours> workingHours,
      required final double latitude,
      required final double longitude}) = _$OfficeImpl;

  factory _Office.fromJson(Map<String, dynamic> json) = _$OfficeImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  List<WorkingHours> get workingHours;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$OfficeImplCopyWith<_$OfficeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
