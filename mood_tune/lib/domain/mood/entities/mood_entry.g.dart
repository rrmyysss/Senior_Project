// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MoodEntry _$MoodEntryFromJson(Map<String, dynamic> json) => _MoodEntry(
  id: json['id'] as String,
  userId: json['userId'] as String,
  moodTag: $enumDecode(_$MoodTagEnumMap, json['moodTag']),
  method: $enumDecode(_$MoodMethodEnumMap, json['method']),
  confidence: (json['confidence'] as num?)?.toDouble(),
  note: json['note'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
  tracksPlayed:
      (json['tracksPlayed'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  sessionDuration: (json['sessionDuration'] as num?)?.toInt(),
);

Map<String, dynamic> _$MoodEntryToJson(_MoodEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'moodTag': _$MoodTagEnumMap[instance.moodTag]!,
      'method': _$MoodMethodEnumMap[instance.method]!,
      'confidence': instance.confidence,
      'note': instance.note,
      'timestamp': instance.timestamp.toIso8601String(),
      'tracksPlayed': instance.tracksPlayed,
      'sessionDuration': instance.sessionDuration,
    };

const _$MoodTagEnumMap = {
  MoodTag.happy: 'Happy',
  MoodTag.sad: 'Sad',
  MoodTag.angry: 'Angry',
  MoodTag.fear: 'Fear',
  MoodTag.surprise: 'Surprise',
  MoodTag.neutral: 'Neutral',
};

const _$MoodMethodEnumMap = {
  MoodMethod.camera: 'camera',
  MoodMethod.manual: 'manual',
};
