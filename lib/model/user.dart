import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

//part <file name> must be like this <file name> with <.g.> in center
part 'user.g.dart';

//RUN IN TERMINAL : flutter pub run build_runner build

@JsonSerializable(explicitToJson: true)
class User {
  //dont use final
  String name;
  int phone;
  bool subscription;
  Address address;
  User({this.name, this.phone, this.address, this.subscription});

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
