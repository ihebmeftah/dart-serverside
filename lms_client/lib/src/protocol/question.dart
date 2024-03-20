/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class Question extends _i1.SerializableEntity {
  Question._({
    this.id,
    required this.question,
    required this.additionalInformation,
    required this.quiz,
    required this.points,
    this.options,
  });

  factory Question({
    int? id,
    required String question,
    required String additionalInformation,
    required int quiz,
    required int points,
    List<_i2.Option>? options,
  }) = _QuestionImpl;

  factory Question.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Question(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      question: serializationManager
          .deserialize<String>(jsonSerialization['question']),
      additionalInformation: serializationManager
          .deserialize<String>(jsonSerialization['additionalInformation']),
      quiz: serializationManager.deserialize<int>(jsonSerialization['quiz']),
      points:
          serializationManager.deserialize<int>(jsonSerialization['points']),
      options: serializationManager
          .deserialize<List<_i2.Option>?>(jsonSerialization['options']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String question;

  String additionalInformation;

  int quiz;

  int points;

  List<_i2.Option>? options;

  Question copyWith({
    int? id,
    String? question,
    String? additionalInformation,
    int? quiz,
    int? points,
    List<_i2.Option>? options,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'question': question,
      'additionalInformation': additionalInformation,
      'quiz': quiz,
      'points': points,
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}

class _Undefined {}

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required String question,
    required String additionalInformation,
    required int quiz,
    required int points,
    List<_i2.Option>? options,
  }) : super._(
          id: id,
          question: question,
          additionalInformation: additionalInformation,
          quiz: quiz,
          points: points,
          options: options,
        );

  @override
  Question copyWith({
    Object? id = _Undefined,
    String? question,
    String? additionalInformation,
    int? quiz,
    int? points,
    Object? options = _Undefined,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      question: question ?? this.question,
      additionalInformation:
          additionalInformation ?? this.additionalInformation,
      quiz: quiz ?? this.quiz,
      points: points ?? this.points,
      options: options is List<_i2.Option>? ? options : this.options?.clone(),
    );
  }
}
