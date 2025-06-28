class ProfileEntity {
  ProfileEntity({
      this.message, 
      this.user,});

  String? message;
  UserData? user;
}

class UserData {
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
  num? weight;
  num? height;
  String? activityLevel;
  String? goal;
  String? photo;
}