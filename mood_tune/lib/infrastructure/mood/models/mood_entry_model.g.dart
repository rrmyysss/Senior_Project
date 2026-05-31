// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MoodEntryModel _$MoodEntryModelFromJson(Map<String, dynamic> json) =>
    _MoodEntryModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      moodTag: json['moodTag'] as String,
      method: json['method'] as String,
      confidence: (json['confidence'] as num?)?.toDouble(),
      note: json['note'] as String?,
      timestamp: json['timestamp'] as String,
      tracksPlayed:
          (json['tracksPlayed'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sessionDuration: (json['sessionDuration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MoodEntryModelToJson(_MoodEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'moodTag': instance.moodTag,
      'method': instance.method,
      'confidence': instance.confidence,
      'note': instance.note,
      'timestamp': instance.timestamp,
      'tracksPlayed': instance.tracksPlayed,
      'sessionDuration': instance.sessionDuration,
    };
