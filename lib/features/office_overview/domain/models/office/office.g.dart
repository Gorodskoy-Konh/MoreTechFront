// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfficeImpl _$$OfficeImplFromJson(Map<String, dynamic> json) => _$OfficeImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      workingHours: (json['working_hours'] as List<dynamic>)
          .map((e) => WorkingHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$OfficeImplToJson(_$OfficeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'working_hours': instance.workingHours,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
