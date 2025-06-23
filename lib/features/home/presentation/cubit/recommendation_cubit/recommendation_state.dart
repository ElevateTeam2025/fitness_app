part of 'recommendation_cubit.dart';


@immutable
sealed class RecommendationState {}

final class RecommendationInitial extends RecommendationState {}
class RecommendationLoading extends RecommendationState{}

class RecommendationSuccess extends RecommendationState {
  final ExercisesResponseEntity data;
  RecommendationSuccess(this.data);
}

class RecommendationError extends RecommendationState {
  final String message;
  RecommendationError(this.message);
}


