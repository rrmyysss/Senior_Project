import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/failures/failure.dart';
import '../../../domain/user/entities/user.dart';
import '../../../domain/user/repositories/i_auth_repository.dart';
import '../../user/models/user_model.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepositoryImpl(this._firebaseAuth, this._firestore);

  @override
  Future<Either<Failure, User>> signIn({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      final uid = userCredential.user?.uid;
      if (uid == null) {
        return const Left(Failure.auth(message: 'User not found.'));
      }

      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists || doc.data() == null) {
        return const Left(Failure.firestore(message: 'User document not found.'));
      }

      final userModel = UserModel.fromJson(doc.data()!);
      return Right(userModel.toDomain());
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? 'Authentication failed'));
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid == null) {
        return const Left(Failure.auth(message: 'Failed to create user.'));
      }

      final newUserModel = UserModel(
        uid: uid,
        email: email,
        displayName: displayName,
        createdAt: DateTime.now().toIso8601String(),
        onboardingCompleted: false,
      );

      await _firestore.collection('users').doc(uid).set(newUserModel.toJson());
      return Right(newUserModel.toDomain());
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? 'Registration failed'));
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(unit);
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, User>> getUser({required String uid}) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists || doc.data() == null) {
        return const Left(Failure.firestore(message: 'User document not found.'));
      }
      return Right(UserModel.fromJson(doc.data()!).toDomain());
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }
}
