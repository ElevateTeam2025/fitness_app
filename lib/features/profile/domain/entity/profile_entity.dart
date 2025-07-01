import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable{
  ProfileEntity({
      this.message, 
      this.user,});

  String? message;
  UserData? user;

  @override
  List<Object?> get props => [message, user];
}

class UserData extends Equatable {
  UserData({
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

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  num? age;
  int? weight;
  num? height;
  String? activityLevel;
  String? goal;
  String? photo;

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    gender,
    age,
    weight,
    height,
    activityLevel,
    goal,
    photo,
  ];
}