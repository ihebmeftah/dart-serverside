import 'package:quiz_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class QuizEndpoint extends Endpoint {
  /// This request "getQuizes" get all quiz in the databe
  /// Ordred by id
  /// Include list question of the quiz 'RELATION ONE TO MANY BIDRECTIONAL RELATION (QUIZ - QUESTIONS)'
  Future<List<Quiz>> getQuizes(Session s) async {
    return Quiz.db.find(s,
        orderBy: (p0) => p0.id,
        include: Quiz.include(questions: Question.includeList()));
  }

  Future<Quiz?> getOneQuiz(Session s, {required int id}) async {
    return Quiz.db.findById(s, id);
  }

  Future<Quiz> createQuiz(
    Session s, {
    required String name,
    required String description,
  }) async {
    return await Quiz.db.insertRow(
        s,
        Quiz(
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
