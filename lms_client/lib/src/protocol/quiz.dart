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

abstract class Quiz extends _i1.SerializableEntity {
  Quiz._({
    this.id,
    required this.name,
    this.desc,
    required this.status,
    required this.categoryId,
    required this.userId,
    required this.points,
  });

  factory Quiz({
    int? id,
    required String name,
    String? desc,
    required _i2.QuizStatus status,
    required int categoryId,
    required int userId,
    required int points,
  }) = _QuizImpl;

  factory Quiz.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Quiz(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      desc:
          serializationManager.deserialize<String?>(jsonSerialization['desc']),
      status: serializationManager
          .deserialize<_i2.QuizStatus>(jsonSerialization['status']),
      categoryId: serializationManager
          .deserialize<int>(jsonSerialization['categoryId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      points:
          serializationManager.deserialize<int>(jsonSerialization['points']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? desc;

  _i2.QuizStatus status;

  int categoryId;

  int userId;

  int points;

  Quiz copyWith({
    int? id,
    String? name,
    String? desc,
    _i2.QuizStatus? status,
    int? categoryId,
    int? userId,
    int? points,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (desc != null) 'desc': desc,
      'status': status.toJson(),
      'categoryId': categoryId,
      'userId': userId,
      'points': points,
    };
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    required String name,
    String? desc,
    required _i2.QuizStatus status,
    required int categoryId,
    required int userId,
    required int points,
  }) : super._(
          id: id,
          name: name,
          desc: desc,
          status: status,
          categoryId: categoryId,
          userId: userId,
          points: points,
        );

  @override
  Quiz copyWith({
    Object? id = _Undefined,
    String? name,
    Object? desc = _Undefined,
    _i2.QuizStatus? status,
    int? categoryId,
    int? userId,
    int? points,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      desc: desc is String? ? desc : this.desc,
      status: status ?? this.status,
      categoryId: categoryId ?? this.categoryId,
      userId: userId ?? this.userId,
      points: points ?? this.points,
    );
  }
}
