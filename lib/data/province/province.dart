import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable()
class Province {
  String code = "";
  String name = "";

  static Province defaultProvince = Province(code: '', name: 'State/Province');

  Province({required this.code, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

  @override
  bool operator ==(Object other) =>
      other is Province && other.code == code;

  @override
  int get hashCode => code.hashCode;

  @override
  String toString() {
    return '$code,$name';
  }
}