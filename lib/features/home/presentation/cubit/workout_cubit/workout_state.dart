part of 'workout_cubit.dart';

@immutable
sealed class WorkoutState {}

final class WorkoutInitial extends WorkoutState {}
class WorkoutLoading extends WorkoutState{}

class WorkoutSuccess extends WorkoutState {
  final ExercisesResponseEntity data;
  WorkoutSuccess(this.data);
}

class WorkoutError extends WorkoutState {
  final String message;
  WorkoutError(this.message);
}


