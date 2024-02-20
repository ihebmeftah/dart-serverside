import 'package:quiz_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class QuestionEndpoint extends Endpoint {
  Future<Quiz> addQuestionToQuiz(
    Session s, {
    required String question,
    required int quizId,
  }) async {
    final Question createdQuestion =
        Question(question: question, quizId: quizId);
    await Question.db.insertRow(s, createdQuestion);
    var quiz = await Quiz.db.findById(s, quizId);
    quiz?.questions?.add(createdQuestion);
    return await Quiz.db.updateRow(s, quiz!);
  }
}
