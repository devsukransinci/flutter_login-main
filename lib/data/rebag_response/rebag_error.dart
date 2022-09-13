import 'package:json_annotation/json_annotation.dart';

part 'rebag_error.g.dart';

@JsonSerializable()
class RebagError {
  String message = "";

  RebagError({required this.message});

  factory RebagError.fromJson(Map<String, dynamic> json) => _$RebagErrorFromJson(json);

  Map<String, dynamic> toJson() => _$RebagErrorToJson(this);
}