// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeResponse _$MemeResponseFromJson(Map<String, dynamic> json) => MemeResponse(
      success: json['success'] as bool,
      data: MemeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MemeResponseToJson(MemeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
