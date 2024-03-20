import 'package:lms_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

import '../scopes/users.scopes.dart';

class QuizEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Quiz>> getQuizes(Session session) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.admin) == true) {
      return await Quiz.db.find(
        session,
        where: (q) => q.userId.equals(userId),
      );
    } else {
      return await Quiz.db.find(
        session,
        where: (q) => q.status.equals(QuizStatus.validated),
      );
    }
  }

  Future<Quiz> createQuiz(Session session,
      {required int categoryId,
      required String name,
      required String desc}) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can create quize',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    final existOrNotCategory = await Category.db.findById(session, categoryId);
    if (existOrNotCategory == null) {
      throw AppException(
          message: 'Category not found', errorType: ExceptionType.notFound);
    }
    final existOrNot = await Quiz.db.findFirstRow(
      session,
      where: (q) => q.name.equals(name),
    );
    if (existOrNot != null) {
      throw AppException(
          message: 'This name of quiz exist $name',
          errorType: ExceptionType.duplicateKeyException);
    }
    final Quiz createdQuiz = await Quiz.db.insertRow(
        session,
        Quiz(
            name: name,
            desc: desc,
            userId: userId,
            categoryId: categoryId,
            status: QuizStatus.pending,
            points: 0));
    return createdQuiz;
  }
}
