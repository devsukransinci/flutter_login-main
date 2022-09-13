// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rebag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RebagResponse _$RebagResponseFromJson(Map<String, dynamic> json) =>
    RebagResponse(
      auth_token: json['auth_token'] as String?,
      is_authenticated: json['is_authenticated'] as bool,
      error: json['error'] == null
          ? null
          : RebagError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RebagResponseToJson(RebagResponse instance) =>
    <String, dynamic>{
      'auth_token': instance.auth_token,
      'is_authenticated': instance.is_authenticated,
      'error': instance.error,
    };
