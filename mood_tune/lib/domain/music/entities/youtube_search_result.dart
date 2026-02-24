import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_search_result.freezed.dart';
part 'youtube_search_result.g.dart';

@freezed
class YouTubeSearchResult with _$YouTubeSearchResult {
  const factory YouTubeSearchResult({
    required String videoId,
    required String title,
    required String channelName,
    required String thumbnailUrl,
    required String duration,
    int? viewCount,
  }) = _YouTubeSearchResult;

  factory YouTubeSearchResult.fromJson(Map<String, dynamic> json) =>
      _$YouTubeSearchResultFromJson(json);
}
