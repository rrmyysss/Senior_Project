import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failures/failure.dart';
import '../../../domain/mood/entities/mood_entry.dart';
import '../../../domain/mood/repositories/i_mood_repository.dart';
import '../models/mood_entry_model.dart';

@LazySingleton(as: IMoodRepository)
class MoodRepositoryImpl implements IMoodRepository {
  final FirebaseFirestore _firestore;

  MoodRepositoryImpl(this._firestore);

  @override
  Future<Either<Failure, String>> addEntry(MoodEntry entry) async {
    try {
      final model = MoodEntryModel.fromDomain(entry);
      await _firestore.collection('mood_entries').doc(model.id).set(model.toJson());
      return Right(model.id);
    } on FirebaseException catch (e) {
      return Left(Failure.firestore(message: e.message));
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, List<MoodEntry>>> getHistory(String userId, {int limit = 10}) async {
    try {
      final snapshot = await _firestore
          .collection('mood_entries')
          .where('userId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .limit(limit)
          .get();

      final entries = snapshot.docs
          .map((doc) => MoodEntryModel.fromJson(doc.data()).toDomain())
          .toList();

      return Right(entries);
    } on FirebaseException catch (e) {
      return Left(Failure.firestore(message: e.message));
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteEntry(String entryId, String userId) async {
    try {
      // In Firestore rules we check that the request auth uid matches.
      // Here we just delete the document.
      await _firestore.collection('mood_entries').doc(entryId).delete();
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(Failure.firestore(message: e.message));
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }
}
