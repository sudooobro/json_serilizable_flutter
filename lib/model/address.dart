import 'package:json_annotation/json_annotation.dart';

//part <file name> must be like this <file name> with <.g.> in center
part 'address.g.dart';

@JsonSerializable()
class Address {
  //dont use final
  String street, landmark, city, state;
  Address({this.street, this.landmark, this.city, this.state});
  factory Address.fromJson(Map<String, dynamic> data) =>
      _$AddressFromJson(data);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
