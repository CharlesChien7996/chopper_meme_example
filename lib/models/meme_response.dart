import 'package:chopper_meme_example/models/meme_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meme_response.g.dart';

@JsonSerializable()
class MemeResponse {
  bool success;
  MemeData data;

  MemeResponse({
    required this.success,
    required this.data,
  });

  factory MemeResponse.fromJson(Map<String, dynamic> json) =>
      _$MemeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MemeResponseToJson(this);
}
