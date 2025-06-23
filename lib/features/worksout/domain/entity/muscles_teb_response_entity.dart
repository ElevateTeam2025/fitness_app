class MusclesTebResponseEntity {
  MusclesTebResponseEntity({
      this.message, 
      this.musclesGroup,});
  String? message;
  List<MusclesComponentEntity>? musclesGroup;

}

class MusclesComponentEntity {
  MusclesComponentEntity({
      this.id, 
      this.name,});

  String? id;
  String? name;



}