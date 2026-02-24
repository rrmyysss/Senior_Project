import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.network() = NetworkFailure;
  const factory Failure.server({String? message}) = ServerFailure;
  const factory Failure.auth({String? message}) = AuthFailure;
  const factory Failure.faceNotDetected() = FaceNotDetectedFailure;
  const factory Failure.lowConfidence() = LowConfidenceFailure;
  const factory Failure.tfliteModel() = TFLiteModelFailure;
  const factory Failure.youTubeQuota() = YouTubeQuotaFailure;
  const factory Failure.youTubeRegion() = YouTubeRegionFailure;
  const factory Failure.cacheExpired() = CacheExpiredFailure;
  const factory Failure.emptyTracks() = EmptyTracksFailure;
  const factory Failure.firestore({String? message}) = FirestoreFailure;
  const factory Failure.unexpected() = UnexpectedFailure;
}
