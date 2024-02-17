import 'package:quiz_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class QuizEndpoint extends Endpoint {
  Future<List<Quiz>> getQuizes(Session s) async {
    return Quiz.db.find(
      s,
      orderBy: (p0) => p0.id,
    );
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
        ));
  }

  Future<Quiz> updateQuizStatus(Session s,
      {required int quizId, required Status status}) async {
    var quiz = await Quiz.db.findById(s, quizId);
    quiz!.status = status;
    return await Quiz.db.updateRow(s, quiz);
  }

  Future<Quiz> updateQuiz(
    Session s, {
    required int quizId,
    required String name,
    required String description,
  }) async {
    var quiz = await Quiz.db.findById(s, quizId);
    quiz!.name = name;
    quiz.description = description;
    return await Quiz.db.updateRow(s, quiz);
  }

  Future<int> deleteQuiz(Session s, Quiz quiz) async {
    return await Quiz.db.deleteRow(s, quiz);
  }
}
