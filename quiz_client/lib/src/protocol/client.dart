/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:quiz_client/src/protocol/question.dart' as _i3;
import 'package:quiz_client/src/protocol/quiz.dart' as _i4;
import 'package:quiz_client/src/protocol/enum/status.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointQuestion extends _i1.EndpointRef {
  EndpointQuestion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'question';

  _i2.Future<_i3.Question> addQuestionToQuiz({
    required String question,
    required int quizId,
  }) =>
      caller.callServerEndpoint<_i3.Question>(
        'question',
        'addQuestionToQuiz',
        {
          'question': question,
          'quizId': quizId,
        },
      );

  _i2.Future<void> deleteQuestion(_i3.Question question) =>
      caller.callServerEndpoint<void>(
        'question',
        'deleteQuestion',
        {'question': question},
      );
}

/// {@category Endpoint}
class EndpointQuiz extends _i1.EndpointRef {
  EndpointQuiz(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quiz';

  /// This request "getQuizes" get all quiz in the databe
  /// Ordred by id
  _i2.Future<List<_i4.Quiz>> getQuizes() =>
      caller.callServerEndpoint<List<_i4.Quiz>>(
        'quiz',
        'getQuizes',
        {},
      );

  /// This request get one quiz by id
  /// Include list question of the quiz 'RELATION ONE TO MANY BIDRECTIONAL RELATION (QUIZ - QUESTIONS)'
  _i2.Future<_i4.Quiz?> getOneQuiz({required int id}) =>
      caller.callServerEndpoint<_i4.Quiz?>(
        'quiz',
        'getOneQuiz',
        {'id': id},
      );

  _i2.Future<_i4.Quiz> createQuiz({
    required String name,
    required String description,
  }) =>
      caller.callServerEndpoint<_i4.Quiz>(
        'quiz',
        'createQuiz',
        {
          'name': name,
          'description': description,
        },
      );

  _i2.Future<int> updateQuizStatus({
    required int quizId,
    required _i5.Status status,
  }) =>
      caller.callServerEndpoint<int>(
        'quiz',
        'updateQuizStatus',
        {
          'quizId': quizId,
          'status': status,
        },
      );

  _i2.Future<int> updateQuiz({
    required int quizId,
    required String name,
    required String description,
  }) =>
      caller.callServerEndpoint<int>(
        'quiz',
        'updateQuiz',
        {
          'quizId': quizId,
          'name': name,
          'description': description,
        },
      );

  _i2.Future<int> deleteQuiz(_i4.Quiz quiz) => caller.callServerEndpoint<int>(
        'quiz',
        'deleteQuiz',
        {'quiz': quiz},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    example = EndpointExample(this);
    question = EndpointQuestion(this);
    quiz = EndpointQuiz(this);
  }

  late final EndpointExample example;

  late final EndpointQuestion question;

  late final EndpointQuiz quiz;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'question': question,
        'quiz': quiz,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
