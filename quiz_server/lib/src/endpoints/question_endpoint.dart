import 'package:quiz_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class QuestionEndpoint extends Endpoint {
  Future<Question> addQuestionToQuiz(
    Session s, {
    required String question,
    required int quizId,
  }) async {
    Quiz? quiz = await Quiz.db.findById(s, quizId);
    Question createdQuestion = Question(question: question, quizId: quizId);
    createdQuestion = await Question.db.insertRow(s, createdQuestion);
    // i do this affectation for have the id in the response 
    quiz?.questions?.add(createdQuestion);
    await Quiz.db.updateRow(s, quiz!);
    return createdQuestion;
  }

  Future<void> deleteQuestion(Session session, Question question) async {
    await Question.db.deleteRow(session, question);
  }
}
