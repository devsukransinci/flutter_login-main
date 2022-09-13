import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  String code = "";
  String name = "";

  static Country defaultCountry = Country(code:'', name: 'Country');

  Country({required this.code, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  bool operator ==(Object other) =>
      other is Country && other.code == code;

  @override
  int get hashCode => code.hashCode;
}