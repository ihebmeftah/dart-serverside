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
import 'package:lms_client/src/protocol/category.dart' as _i3;
import 'package:lms_client/src/protocol/question.dart' as _i4;
import 'package:lms_client/src/protocol/quiz.dart' as _i5;
import 'package:lms_client/src/protocol/player.dart' as _i6;
import 'package:lms_client/src/protocol/admin.dart' as _i7;
import 'package:serverpod_auth_client/module.dart' as _i8;
import 'protocol.dart' as _i9;

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<List<_i3.Category>> getCategory() =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'getCategory',
        {},
      );

  _i2.Future<_i3.Category> createCategory({
    required String name,
    required String desc,
  }) =>
      caller.callServerEndpoint<_i3.Category>(
        'category',
        'createCategory',
        {
          'name': name,
          'desc': desc,
        },
      );

  _i2.Future<String> deleteCategroy(int id) =>
      caller.callServerEndpoint<String>(
        'category',
        'deleteCategroy',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointQuestion extends _i1.EndpointRef {
  EndpointQuestion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'question';

  _i2.Future<List<_i4.Question>> getQuestionsByQuiz(int quizId) =>
      caller.callServerEndpoint<List<_i4.Question>>(
        'question',
        'getQuestionsByQuiz',
        {'quizId': quizId},
      );

  _i2.Future<_i4.Question> createQuestion({
    required int quizId,
    required String question,
    required String additionalInformation,
  }) =>
      caller.callServerEndpoint<_i4.Question>(
        'question',
        'createQuestion',
        {
          'quizId': quizId,
          'question': question,
          'additionalInformation': additionalInformation,
        },
      );

  _i2.Future<String> deleteQuestion(int id) =>
      caller.callServerEndpoint<String>(
        'question',
        'deleteQuestion',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointQuiz extends _i1.EndpointRef {
  EndpointQuiz(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quiz';

  _i2.Future<List<_i5.Quiz>> getQuizes() =>
      caller.callServerEndpoint<List<_i5.Quiz>>(
        'quiz',
        'getQuizes',
        {},
      );

  _i2.Future<List<_i5.Quiz>> getQuizesByCategeroy(int categoryId) =>
      caller.callServerEndpoint<List<_i5.Quiz>>(
        'quiz',
        'getQuizesByCategeroy',
        {'categoryId': categoryId},
      );

  _i2.Future<_i5.Quiz?> getQuiz(int id) => caller.callServerEndpoint<_i5.Quiz?>(
        'quiz',
        'getQuiz',
        {'id': id},
      );

  _i2.Future<_i5.Quiz> createQuiz({
    required int categoryId,
    required String name,
    required String desc,
  }) =>
      caller.callServerEndpoint<_i5.Quiz>(
        'quiz',
        'createQuiz',
        {
          'categoryId': categoryId,
          'name': name,
          'desc': desc,
        },
      );

  _i2.Future<String> deleteQuiz(int id) => caller.callServerEndpoint<String>(
        'quiz',
        'deleteQuiz',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointUsers extends _i1.EndpointRef {
  EndpointUsers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'users';

  _i2.Future<String> createUsers({
    required bool isAdmin,
    required int userId,
  }) =>
      caller.callServerEndpoint<String>(
        'users',
        'createUsers',
        {
          'isAdmin': isAdmin,
          'userId': userId,
        },
      );

  _i2.Future<List<_i6.Player>> getPlayers() =>
      caller.callServerEndpoint<List<_i6.Player>>(
        'users',
        'getPlayers',
        {},
      );

  _i2.Future<List<_i7.Admin>> getAdmins() =>
      caller.callServerEndpoint<List<_i7.Admin>>(
        'users',
        'getAdmins',
        {},
      );

  ///(ADMIN , PLAYER)
  _i2.Future<List<int>> getUsersNumber() =>
      caller.callServerEndpoint<List<int>>(
        'users',
        'getUsersNumber',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i8.Caller(client);
  }

  late final _i8.Caller auth;
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
          _i9.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    category = EndpointCategory(this);
    question = EndpointQuestion(this);
    quiz = EndpointQuiz(this);
    users = EndpointUsers(this);
    modules = _Modules(this);
  }

  late final EndpointCategory category;

  late final EndpointQuestion question;

  late final EndpointQuiz quiz;

  late final EndpointUsers users;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'category': category,
        'question': question,
        'quiz': quiz,
        'users': users,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
