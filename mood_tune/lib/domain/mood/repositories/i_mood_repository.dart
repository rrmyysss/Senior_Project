import 'package:fpdart/fpdart.dart';
import '../../core/failures/failure.dart';
import '../entities/mood_entry.dart';

abstract class IMoodRepository {
  Future<Either<Failure, String>> addEntry(MoodEntry entry);
  Future<Either<Failure, List<MoodEntry>>> getHistory(String userId, {int limit = 10});
  Future<Either<Failure, Unit>> deleteEntry(String entryId, String userId);
}
