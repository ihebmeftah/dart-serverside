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
import '../endpoints/option_endpoint.dart' as _i3;
import '../endpoints/question_endpoint.dart' as _i4;
import '../endpoints/quiz_endpoint.dart' as _i5;
import '../endpoints/users_endpoint.dart' as _i6;
import 'package:serverpod_auth_server/module.dart' as _i7;

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
      'option': _i3.OptionEndpoint()
        ..initialize(
          server,
          'option',
          null,
        ),
      'question': _i4.QuestionEndpoint()
        ..initialize(
          server,
          'question',
          null,
        ),
      'quiz': _i5.QuizEndpoint()
        ..initialize(
          server,
          'quiz',
          null,
        ),
      'users': _i6.UsersEndpoint()
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
    connectors['option'] = _i1.EndpointConnector(
      name: 'option',
      endpoint: endpoints['option']!,
      methodConnectors: {
        'createOption': _i1.MethodConnector(
          name: 'createOption',
          params: {
            'questionId': _i1.ParameterDescription(
              name: 'questionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'text': _i1.ParameterDescription(
              name: 'text',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isCorrect': _i1.ParameterDescription(
              name: 'isCorrect',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['option'] as _i3.OptionEndpoint).createOption(
            session,
            questionId: params['questionId'],
            text: params['text'],
            isCorrect: params['isCorrect'],
          ),
        ),
        'deleteOption': _i1.MethodConnector(
          name: 'deleteOption',
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
              (endpoints['option'] as _i3.OptionEndpoint).deleteOption(
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
              (endpoints['question'] as _i4.QuestionEndpoint)
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
              (endpoints['question'] as _i4.QuestionEndpoint).createQuestion(
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
              (endpoints['question'] as _i4.QuestionEndpoint).deleteQuestion(
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
              (endpoints['quiz'] as _i5.QuizEndpoint).getQuizes(session),
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
              (endpoints['quiz'] as _i5.QuizEndpoint).getQuizesByCategeroy(
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
              (endpoints['quiz'] as _i5.QuizEndpoint).getQuiz(
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
              (endpoints['quiz'] as _i5.QuizEndpoint).createQuiz(
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
              (endpoints['quiz'] as _i5.QuizEndpoint).deleteQuiz(
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
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'isAdmin': _i1.ParameterDescription(
              name: 'isAdmin',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i6.UsersEndpoint).register(
            session,
            isAdmin: params['isAdmin'],
            name: params['name'],
            email: params['email'],
            password: params['password'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i6.UsersEndpoint).login(
            session,
            email: params['email'],
            password: params['password'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}
