/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class Quiz extends _i1.SerializableEntity {
  Quiz._({
    this.id,
    required this.name,
    required this.description,
    required this.status,
    this.questions,
  });

  factory Quiz({
    int? id,
    required String name,
    required String description,
    required _i2.Status status,
    List<_i2.Question>? questions,
  }) = _QuizImpl;

  factory Quiz.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Quiz(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      status: serializationManager
          .deserialize<_i2.Status>(jsonSerialization['status']),
      questions: serializationManager
          .deserialize<List<_i2.Question>?>(jsonSerialization['questions']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  _i2.Status status;

  /// ONE TO MANY BIDRECTIONAL RELATION (QUIZ - QUESTIONS)
  List<_i2.Question>? questions;

  Quiz copyWith({
    int? id,
    String? name,
    String? description,
    _i2.Status? status,
    List<_i2.Question>? questions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'status': status.toJson(),
      if (questions != null)
        'questions': questions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    required String name,
    required String description,
    required _i2.Status status,
    List<_i2.Question>? questions,
  }) : super._(
          id: id,
          name: name,
          description: description,
          status: status,
          questions: questions,
        );

  @override
  Quiz copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    _i2.Status? status,
    Object? questions = _Undefined,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      questions: questions is List<_i2.Question>?
          ? questions
          : this.questions?.clone(),
    );
  }
}
