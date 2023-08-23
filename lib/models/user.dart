library lib.models.user;

/// Represents user information.
///
/// Author: Shradha Shinde
class User {
  final String username;
  final String sex;
  final int age;
  final String municipality;
  final String provinceName;
  final String pictureUrl;

  User({
    required this.username,
    required this.sex,
    required this.age,
    required this.municipality,
    required this.provinceName,
    required this.pictureUrl,
  });
}
