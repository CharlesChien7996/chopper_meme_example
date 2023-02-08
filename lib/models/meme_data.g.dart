// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeData _$MemeDataFromJson(Map<String, dynamic> json) => MemeData(
      memes: (json['memes'] as List<dynamic>)
          .map((e) => Meme.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MemeDataToJson(MemeData instance) => <String, dynamic>{
      'memes': instance.memes,
    };
