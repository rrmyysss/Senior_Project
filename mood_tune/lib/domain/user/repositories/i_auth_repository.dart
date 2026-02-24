import 'package:fpdart/fpdart.dart';
import '../../core/failures/failure.dart';
import '../entities/user.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> signIn({required String email, required String password});
  Future<Either<Failure, User>> signUp({required String email, required String password, required String displayName});
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, User>> getUser({required String uid});
}
