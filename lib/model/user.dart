import 'educator.dart';

class User{
  String email;
  String name;
  String thumbnail;
  Educator? educator;
  // String status;
  // String role;

  User({
    required this.email,
    required this.name,
    required this.thumbnail,
    this.educator,
    // required this.status,
    // required this.role,
  });
}