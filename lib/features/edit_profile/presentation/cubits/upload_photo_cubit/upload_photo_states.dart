sealed class UploadPhotoStates {}

class UploadPhotoInitial extends UploadPhotoStates {}

class UploadPhotoLoading extends UploadPhotoStates {}

class UploadPhotoSuccess extends UploadPhotoStates {}

class UploadPhotoError extends UploadPhotoStates {
  final String message;
  UploadPhotoError({required this.message});
}
