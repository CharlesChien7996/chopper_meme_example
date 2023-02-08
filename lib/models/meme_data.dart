import 'package:chopper_meme_example/models/meme.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meme_data.g.dart';

@JsonSerializable()
class MemeData {
  List<Meme> memes;

  MemeData({required this.memes});

  factory MemeData.fromJson(Map<String, dynamic> json) => _$MemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MemeDataToJson(this);
}
