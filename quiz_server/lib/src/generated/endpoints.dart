/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/question_endpoint.dart' as _i2;
import '../endpoints/quiz_endpoint.dart' as _i3;
import 'package:quiz_server/src/generated/question.dart' as _i4;
import 'package:quiz_server/src/generated/enum/status.dart' as _i5;
import 'package:quiz_server/src/generated/quiz.dart' as _i6;
import 'package:serverpod_auth_server/module.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'question': _i2.QuestionEndpoint()
        ..initialize(
          server,
          'question',
          null,
        ),
      'quiz': _i3.QuizEndpoint()
        ..initialize(
          server,
          'quiz',
          null,
        ),
    };
    connectors['question'] = _i1.EndpointConnector(
      name: 'question',
      endpoint: endpoints['question']!,
      methodConnectors: {
        'addQuestionToQuiz': _i1.MethodConnector(
          name: 'addQuestionToQuiz',
          params: {
            'question': _i1.ParameterDescription(
              name: 'question',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'quizId': _i1.ParameterDescription(
              name: 'quizId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i2.QuestionEndpoint).addQuestionToQuiz(
            session,
            question: params['question'],
            quizId: params['quizId'],
          ),
        ),
        'deleteQuestion': _i1.MethodConnector(
          name: 'deleteQuestion',
          params: {
            'question': _i1.ParameterDescription(
              name: 'question',
              type: _i1.getType<_i4.Question>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i2.QuestionEndpoint).deleteQuestion(
            session,
            params['question'],
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
              (endpoints['quiz'] as _i3.QuizEndpoint).getQuizes(session),
        ),
        'getOneQuiz': _i1.MethodConnector(
          name: 'getOneQuiz',
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
              (endpoints['quiz'] as _i3.QuizEndpoint).getOneQuiz(
            session,
            id: params['id'],
          ),
        ),
        'createQuiz': _i1.MethodConnector(
          name: 'createQuiz',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).createQuiz(
            session,
            name: params['name'],
            description: params['description'],
          ),
        ),
        'updateQuizStatus': _i1.MethodConnector(
          name: 'updateQuizStatus',
          params: {
            'quizId': _i1.ParameterDescription(
              name: 'quizId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i5.Status>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).updateQuizStatus(
            session,
            quizId: params['quizId'],
            status: params['status'],
          ),
        ),
        'updateQuiz': _i1.MethodConnector(
          name: 'updateQuiz',
          params: {
            'quizId': _i1.ParameterDescription(
              name: 'quizId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).updateQuiz(
            session,
            quizId: params['quizId'],
            name: params['name'],
            description: params['description'],
          ),
        ),
        'deleteQuiz': _i1.MethodConnector(
          name: 'deleteQuiz',
          params: {
            'quiz': _i1.ParameterDescription(
              name: 'quiz',
              type: _i1.getType<_i6.Quiz>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i3.QuizEndpoint).deleteQuiz(
            session,
            params['quiz'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}
