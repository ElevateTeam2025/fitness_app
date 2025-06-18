class UserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int age;
  final int weight;
  final int height;
  final String activityLevel;
  final String goal;
  final String photo;
  final String id;
  final DateTime createdAt;

  const UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.activityLevel,
    required this.goal,
    required this.photo,
    required this.id,
    required this.createdAt,
  });
}
