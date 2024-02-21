/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Question extends _i1.SerializableEntity {
  Question._({
    this.id,
    required this.question,
    required this.quizId,
  });

  factory Question({
    int? id,
    required String question,
    required int quizId,
  }) = _QuestionImpl;

  factory Question.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Question(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      question: serializationManager
          .deserialize<String>(jsonSerialization['question']),
      quizId:
          serializationManager.deserialize<int>(jsonSerialization['quizId']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String question;

  /// ONE TO MANY BIDRECTIONAL RELATION (QUIZ - QUESTIONS)
  int quizId;

  Question copyWith({
    int? id,
    String? question,
    int? quizId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'question': question,
      'quizId': quizId,
    };
  }
}

class _Undefined {}

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required String question,
    required int quizId,
  }) : super._(
          id: id,
          question: question,
          quizId: quizId,
        );

  @override
  Question copyWith({
    Object? id = _Undefined,
    String? question,
    int? quizId,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      question: question ?? this.question,
      quizId: quizId ?? this.quizId,
    );
  }
}
