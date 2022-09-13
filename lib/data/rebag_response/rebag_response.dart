import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_login/data/rebag_response/rebag_error.dart';

part 'rebag_response.g.dart';

@JsonSerializable()
class RebagResponse {

  String? auth_token;
  bool is_authenticated;
  RebagError? error;


  RebagResponse ({required this.auth_token, required this.is_authenticated,
                  required this.error});

  factory RebagResponse.fromJson(Map<String, dynamic> json) => _$RebagResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RebagResponseToJson(this);
}

