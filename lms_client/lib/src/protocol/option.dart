/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Option extends _i1.SerializableEntity {
  Option._({
    this.id,
    required this.text,
    required this.isCorrect,
    required this.question,
  });

  factory Option({
    int? id,
    required String text,
    required bool isCorrect,
    required int question,
  }) = _OptionImpl;

  factory Option.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Option(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      isCorrect: serializationManager
          .deserialize<bool>(jsonSerialization['isCorrect']),
      question:
          serializationManager.deserialize<int>(jsonSerialization['question']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String text;

  bool isCorrect;

  int question;

  Option copyWith({
    int? id,
    String? text,
    bool? isCorrect,
    int? question,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'isCorrect': isCorrect,
      'question': question,
    };
  }
}

class _Undefined {}

class _OptionImpl extends Option {
  _OptionImpl({
    int? id,
    required String text,
    required bool isCorrect,
    required int question,
  }) : super._(
          id: id,
          text: text,
          isCorrect: isCorrect,
          question: question,
        );

  @override
  Option copyWith({
    Object? id = _Undefined,
    String? text,
    bool? isCorrect,
    int? question,
  }) {
    return Option(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      isCorrect: isCorrect ?? this.isCorrect,
      question: question ?? this.question,
    );
  }
}
