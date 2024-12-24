import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AppUser {
  final String email;
  final String accessToken;

const AppUser(this.email, this.accessToken);
}