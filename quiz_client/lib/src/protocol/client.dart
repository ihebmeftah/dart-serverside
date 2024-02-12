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
import 'package:quiz_client/src/protocol/models/quiz.dart' as _i3;
import 'package:quiz_client/src/protocol/models/enum/status.dart' as _i4;
import 'protocol.dart' as _i5;

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
class EndpointQuiz extends _i1.EndpointRef {
  EndpointQuiz(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quiz';

  _i2.Future<List<_i3.Quiz>> getQuizes() =>
      caller.callServerEndpoint<List<_i3.Quiz>>(
        'quiz',
        'getQuizes',
        {},
      );

  _i2.Future<_i3.Quiz?> getOneQuiz({required int id}) =>
      caller.callServerEndpoint<_i3.Quiz?>(
        'quiz',
        'getOneQuiz',
        {'id': id},
      );

  _i2.Future<_i3.Quiz> createQuiz({
    required String name,
    required String description,
  }) =>
      caller.callServerEndpoint<_i3.Quiz>(
        'quiz',
        'createQuiz',
        {
          'name': name,
          'description': description,
        },
      );

  _i2.Future<_i3.Quiz> updateQuizStatus({
    required int quizId,
    required _i4.Status status,
  }) =>
      caller.callServerEndpoint<_i3.Quiz>(
        'quiz',
        'updateQuizStatus',
        {
          'quizId': quizId,
          'status': status,
        },
      );

  _i2.Future<_i3.Quiz> updateQuiz({
    required int quizId,
    required String name,
    required String description,
  }) =>
      caller.callServerEndpoint<_i3.Quiz>(
        'quiz',
        'updateQuiz',
        {
          'quizId': quizId,
          'name': name,
          'description': description,
        },
      );

  _i2.Future<int> deleteQuiz(_i3.Quiz quiz) => caller.callServerEndpoint<int>(
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
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    example = EndpointExample(this);
    quiz = EndpointQuiz(this);
  }

  late final EndpointExample example;

  late final EndpointQuiz quiz;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'quiz': quiz,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
