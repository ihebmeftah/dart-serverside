import 'package:lms_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

import '../scopes/users.scopes.dart';

class OptionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<Option> createOption(
    Session session, {
    required int questionId,
    required String text,
    required bool isCorrect,
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
          message: 'Only admin user can create category',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    final question = await Question.db.findById(session, questionId);
    if (question == null) {
      throw AppException(
          message: 'Question not found', errorType: ExceptionType.notFound);
    }
    final questionOption = await Option.db.find(
      session,
      where: (p0) => p0.question.equals(questionId),
    );
    if (questionOption.any((element) =>
        element.text.trim().toLowerCase() == text.trim().toLowerCase())) {
      throw AppException(
          message: 'This option exist',
          errorType: ExceptionType.duplicateKeyException);
    }
    if (questionOption.length >= 4) {
      throw AppException(
          message: 'Max option is 4', errorType: ExceptionType.badRequest);
    }
    /*  if (questionOption.length == 3 &&
        questionOption.any((element) => element.isCorrect == false)) {
      isCorrect = true;
    }*/
    if (isCorrect) {
      int index = questionOption.indexWhere((element) => element.isCorrect);
      if (index != -1) {
        questionOption[index].isCorrect = false;
        await Option.db.updateRow(session, questionOption[index]);
      }
    }
    return await Option.db.insertRow(session,
        Option(text: text, isCorrect: isCorrect, question: question.id!));
  }

  Future<String> deleteOption(Session session, int id) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can create category',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    final existOrNot = await Option.db.findById(session, id);
    if (existOrNot == null) {
      throw AppException(
          message: 'Option not found', errorType: ExceptionType.notFound);
    }
    await Option.db.deleteRow(session, existOrNot);
    return 'Option deleted successfully = ${existOrNot.toString()}';
  }
}
