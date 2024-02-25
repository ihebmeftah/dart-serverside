import 'package:quiz_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class QuestionEndpoint extends Endpoint {
  Future<Question> addQuestionToQuiz(
    Session s, {
    required String question,
    required int quizId,
  }) async {
    Quiz? quiz = await Quiz.db.findById(s, quizId);
    final Question createdQuestion =
        Question(question: question, quizId: quizId);
    await Question.db.insertRow(s, createdQuestion);
    quiz?.questions?.add(createdQuestion);
    await Quiz.db.updateRow(s, quiz!);
    return createdQuestion;
  }
}
