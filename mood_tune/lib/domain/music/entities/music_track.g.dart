// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicTrack _$MusicTrackFromJson(Map<String, dynamic> json) => _MusicTrack(
  id: json['id'] as String,
  title: json['title'] as String,
  artist: json['artist'] as String,
  youtubeVideoId: json['youtubeVideoId'] as String,
  youtubeUrl: json['youtubeUrl'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String,
  channelName: json['channelName'] as String,
  moodTag: $enumDecode(_$MoodTagEnumMap, json['moodTag']),
  source: $enumDecode(_$TrackSourceEnumMap, json['source']),
  genre: json['genre'] as String?,
  durationMs: (json['durationMs'] as num?)?.toInt(),
  previewUrl: json['previewUrl'] as String?,
  popularity: (json['popularity'] as num?)?.toInt(),
);

Map<String, dynamic> _$MusicTrackToJson(_MusicTrack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'youtubeVideoId': instance.youtubeVideoId,
      'youtubeUrl': instance.youtubeUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'channelName': instance.channelName,
      'moodTag': _$MoodTagEnumMap[instance.moodTag]!,
      'source': _$TrackSourceEnumMap[instance.source]!,
      'genre': instance.genre,
      'durationMs': instance.durationMs,
      'previewUrl': instance.previewUrl,
      'popularity': instance.popularity,
    };

const _$MoodTagEnumMap = {
  MoodTag.happy: 'Happy',
  MoodTag.sad: 'Sad',
  MoodTag.angry: 'Angry',
  MoodTag.fear: 'Fear',
  MoodTag.surprise: 'Surprise',
  MoodTag.neutral: 'Neutral',
};

const _$TrackSourceEnumMap = {
  TrackSource.manual: 'manual',
  TrackSource.youtubeApi: 'youtube_api',
};
