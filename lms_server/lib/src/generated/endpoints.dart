/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/category_endpoint.dart' as _i2;
import '../endpoints/question_endpoint.dart' as _i3;
import '../endpoints/quiz_endpoint.dart' as _i4;
import '../endpoints/users_endpoint.dart' as _i5;
import 'package:serverpod_auth_server/module.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'category': _i2.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'question': _i3.QuestionEndpoint()
        ..initialize(
          server,
          'question',
          null,
        ),
      'quiz': _i4.QuizEndpoint()
        ..initialize(
          server,
          'quiz',
          null,
        ),
      'users': _i5.UsersEndpoint()
        ..initialize(
          server,
          'users',
          null,
        ),
    };
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'getCategory': _i1.MethodConnector(
          name: 'getCategory',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint)
                  .getCategory(session),
        ),
        'createCategory': _i1.MethodConnector(
          name: 'createCategory',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'desc': _i1.ParameterDescription(
              name: 'desc',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).createCategory(
            session,
            name: params['name'],
            desc: params['desc'],
          ),
        ),
        'deleteCategroy': _i1.MethodConnector(
          name: 'deleteCategroy',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).deleteCategroy(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['question'] = _i1.EndpointConnector(
      name: 'question',
      endpoint: endpoints['question']!,
      methodConnectors: {
        'getQuestionsByQuiz': _i1.MethodConnector(
          name: 'getQuestionsByQuiz',
          params: {
            'quizId': _i1.ParameterDescription(
              name: 'quizId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i3.QuestionEndpoint)
                  .getQuestionsByQuiz(
            session,
            params['quizId'],
          ),
        ),
        'createQuestion': _i1.MethodConnector(
          name: 'createQuestion',
          params: {
            'quizId': _i1.ParameterDescription(
              name: 'quizId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'question': _i1.ParameterDescription(
              name: 'question',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'additionalInformation': _i1.ParameterDescription(
              name: 'additionalInformation',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i3.QuestionEndpoint).createQuestion(
            session,
            quizId: params['quizId'],
            question: params['question'],
            additionalInformation: params['additionalInformation'],
          ),
        ),
        'deleteQuestion': _i1.MethodConnector(
          name: 'deleteQuestion',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i3.QuestionEndpoint).deleteQuestion(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['quiz'] = _i1.EndpointConnector(
      name: 'quiz',
      endpoint: endpoints['quiz']!,
      methodConnectors: {
        'getQuizes': _i1.MethodConnector(
          name: 'getQuizes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i4.QuizEndpoint).getQuizes(session),
        ),
        'getQuizesByCategeroy': _i1.MethodConnector(
          name: 'getQuizesByCategeroy',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i4.QuizEndpoint).getQuizesByCategeroy(
            session,
            params['categoryId'],
          ),
        ),
        'getQuiz': _i1.MethodConnector(
          name: 'getQuiz',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i4.QuizEndpoint).getQuiz(
            session,
            params['id'],
          ),
        ),
        'createQuiz': _i1.MethodConnector(
          name: 'createQuiz',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'desc': _i1.ParameterDescription(
              name: 'desc',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i4.QuizEndpoint).createQuiz(
            session,
            categoryId: params['categoryId'],
            name: params['name'],
            desc: params['desc'],
          ),
        ),
        'deleteQuiz': _i1.MethodConnector(
          name: 'deleteQuiz',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i4.QuizEndpoint).deleteQuiz(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['users'] = _i1.EndpointConnector(
      name: 'users',
      endpoint: endpoints['users']!,
      methodConnectors: {
        'createUsers': _i1.MethodConnector(
          name: 'createUsers',
          params: {
            'isAdmin': _i1.ParameterDescription(
              name: 'isAdmin',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).createUsers(
            session,
            isAdmin: params['isAdmin'],
            userId: params['userId'],
          ),
        ),
        'getPlayers': _i1.MethodConnector(
          name: 'getPlayers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).getPlayers(session),
        ),
        'getAdmins': _i1.MethodConnector(
          name: 'getAdmins',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).getAdmins(session),
        ),
        'getUsersNumber': _i1.MethodConnector(
          name: 'getUsersNumber',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.UsersEndpoint).getUsersNumber(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
