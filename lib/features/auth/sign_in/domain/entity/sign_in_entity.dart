class SignInEntity {
  final String? message;
  final UserInfo? user;
  final String? token;

  SignInEntity({
    this.message,
    this.user,
    this.token,
  });
}

class UserInfo {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final num? age;
  final num? weight;
  final num? height;
  final String? activityLevel;
  final String? goal;
  final String? photo;

  UserInfo({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
  });
}
