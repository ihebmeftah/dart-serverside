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
        include: Quiz.include(
            question: Question.includeList(
                where: (p0) => p0.options.count().equals(4),
                include: Question.include(
                  options: Option.includeList(),
                ))),
      );
    }
  }

  Future<List<Quiz>> getQuizesByCategeroy(
      Session session, int categoryId) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final existOrNotCategory = await Category.db.findById(session, categoryId);
    if (existOrNotCategory == null) {
      throw AppException(
          message: 'Category not found', errorType: ExceptionType.notFound);
    }
    return await Quiz.db.find(
      session,
      where: (q) => q.categoryId.equals(categoryId),
      include: Quiz.include(
          question: Question.includeList(
              where: (p0) => p0.options.count().equals(4),
              include: Question.include(options: Option.includeList()))),
    );
  }

  Future<Quiz?> getQuiz(Session session, int id) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final quiz = await Quiz.db.findById(
      session,
      id,
      include: Quiz.include(
        question: Question.includeList(
          include: Question.include(options: Option.includeList()),
        ),
      ),
    );
    return quiz;
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
      where: (q) => q.name.ilike(name.trim()),
    );
    if (existOrNot != null) {
      throw AppException(
          message: 'This name of quiz exist $name',
          errorType: ExceptionType.duplicateKeyException);
    }
    final Quiz createdQuiz = await Quiz.db.insertRow(
        session,
        Quiz(
            name: name.trim(),
            desc: desc,
            userId: userId,
            categoryId: categoryId,
            points: 0));
    return createdQuiz;
  }

  Future<String> deleteQuiz(Session session, int id) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
        message: 'This request required authintification of admin',
        errorType: ExceptionType.authenticationRequiredException,
      );
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
        message: 'Only admin user can delete quiz',
        errorType: ExceptionType.unauthorizedAccessException,
      );
    }
    final quiz = await Quiz.db.findById(session, id);
    if (quiz == null) {
      throw AppException(
        message: 'This quiz not  found',
        errorType: ExceptionType.notFound,
      );
    }
    await Quiz.db.deleteRow(session, quiz);
    return 'Quiz deleted successfully = ${quiz.toString()}';
  }
}
