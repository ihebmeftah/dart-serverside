import 'dart:developer';

import 'package:quiz_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class QuizEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// This request "getQuizes" get all quiz in the databe
  /// Ordred by id
  Future<List<Quiz>> getQuizes(Session s) async {
    int? userId = await s.auth.authenticatedUserId;
    return Quiz.db.find(
      s,
      orderBy: (p0) => p0.id,
      where: (p0) => p0.userId.equals(userId),
    );
  }

  /// This request get one quiz by id
  /// Include list question of the quiz 'RELATION ONE TO MANY BIDRECTIONAL RELATION (QUIZ - QUESTIONS)'
  Future<Quiz?> getOneQuiz(Session s, {required int id}) async {
    return Quiz.db.findById(
      s,
      id,
      include: Quiz.include(questions: Question.includeList()),
    );
  }

  Future<Quiz> createQuiz(
    Session s, {
    required String name,
    required String description,
  }) async {
    int? userId = await s.auth.authenticatedUserId;
    log(s.scopes.toString());
    return await Quiz.db.insertRow(
        s,
        Quiz(
            userId: userId!,
            name: name,
            description: description,
            status: Status.pending,
            questions: []));
  }

  Future<int> updateQuizStatus(Session s,
      {required int quizId, required Status status}) async {
    Quiz? quiz = await Quiz.db.findById(s, quizId);
    quiz!.status = status;
    quiz = await Quiz.db.updateRow(s, quiz);
    return quiz.id!;
  }

  Future<int> updateQuiz(
    Session s, {
    required int quizId,
    required String name,
    required String description,
  }) async {
    Quiz? quiz = await Quiz.db.findById(s, quizId);
    quiz!.name = name;
    quiz.description = description;
    quiz = await Quiz.db.updateRow(s, quiz);
    return quiz.id!;
  }

  Future<int> deleteQuiz(Session s, Quiz quiz) async {
    await Quiz.db.deleteRow(s, quiz);
    return quiz.id!;
  }
}
