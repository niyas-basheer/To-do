import 'package:hive_flutter/hive_flutter.dart';

part 'signin.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
  });
}
