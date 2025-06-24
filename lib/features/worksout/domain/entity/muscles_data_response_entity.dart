class MusclesDataResponseEntity {
  MusclesDataResponseEntity({this.message, this.muscles});

  String? message;

  List<MusclesDataListEntity>? muscles;
}

class MusclesDataListEntity {
  MusclesDataListEntity({this.id, this.name, this.image});

  String? id;
  String? name;
  String? image;
}
