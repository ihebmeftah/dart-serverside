import 'package:lms_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

import '../scopes/users.scopes.dart';

class QuestionEndpoint extends Endpoint {
  Future<List<Question>> getQuestionsByQuiz(Session session, int quizId) async {
    final quiz = await Quiz.db.findById(session, quizId);
    if (quiz == null) {
      throw AppException(
          message: 'Quiz not found', errorType: ExceptionType.notFound);
    }
    return await Question.db.find(session,
        where: (p0) => p0.quiz.equals(quizId),
        include: Question.include(options: Option.includeList()));
  }

  Future<Question> createQuestion(
    Session session, {
    required int quizId,
    required String question,
    required String additionalInformation,
  }) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can create questions',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    final quiz = await Quiz.db.findById(session, quizId);
    if (quiz == null) {
      throw AppException(
          message: 'Quiz not found', errorType: ExceptionType.notFound);
    }
    int nbQuestionsOfQuiz =
        await Question.db.count(session, where: (p0) => p0.quiz.equals(quizId));
    if (nbQuestionsOfQuiz >= 10) {
      throw AppException(
          message: 'Quiz can have max 10 questions',
          errorType: ExceptionType.badRequest);
    }
    final questionExist = await Question.db
        .findFirstRow(session, where: (q) => q.question.ilike(question.trim()));
    if (questionExist != null) {
      throw AppException(
          message: 'Question exist',
          errorType: ExceptionType.duplicateKeyException);
    }
    final Question createdQuestion = await Question.db.insertRow(
        session,
        Question(
            question: question.trim(),
            additionalInformation: additionalInformation,
            quiz: quizId,
            points: 5 ,));
    quiz.points += createdQuestion.points;
    await Quiz.db.updateRow(session, quiz);
    return createdQuestion;
  }

  Future<String> deleteQuestion(Session session, int id) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can create questions',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    final question = await Question.db.findById(session, id);
    if (question == null) {
      throw AppException(
          message: 'Question not found', errorType: ExceptionType.notFound);
    }
    final quiz = await Quiz.db.findById(session, question.quiz);
    if (quiz == null) {
      throw AppException(
          message: 'Quiz not found', errorType: ExceptionType.notFound);
    }
    await Question.db.deleteRow(session, question);
    quiz.points -= question.points;
    await Quiz.db.updateRow(session, quiz);
    return 'Question deleted successfully = ${question.toString()}';
  }
}
