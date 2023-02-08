import 'package:json_annotation/json_annotation.dart';

part 'meme.g.dart';

@JsonSerializable()
class Meme {
  String id;
  String name;
  String url;
  int width;
  int height;
  @JsonKey(name: 'box_count')
  int boxCount;

  Meme({
    required this.id,
    required this.name,
    required this.url,
    required this.width,
    required this.height,
    required this.boxCount,
  });

  factory Meme.fromJson(Map<String, dynamic> json) => _$MemeFromJson(json);

  Map<String, dynamic> toJson() => _$MemeToJson(this);
}
