// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YouTubeSearchResult _$YouTubeSearchResultFromJson(Map<String, dynamic> json) =>
    _YouTubeSearchResult(
      videoId: json['videoId'] as String,
      title: json['title'] as String,
      channelName: json['channelName'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      duration: json['duration'] as String,
      viewCount: (json['viewCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$YouTubeSearchResultToJson(
  _YouTubeSearchResult instance,
) => <String, dynamic>{
  'videoId': instance.videoId,
  'title': instance.title,
  'channelName': instance.channelName,
  'thumbnailUrl': instance.thumbnailUrl,
  'duration': instance.duration,
  'viewCount': instance.viewCount,
};
