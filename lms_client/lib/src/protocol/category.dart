/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Category extends _i1.SerializableEntity {
  Category._({
    this.id,
    required this.name,
    required this.desc,
    required this.userId,
    this.nbQuiz,
  });

  factory Category({
    int? id,
    required String name,
    required String desc,
    required int userId,
    int? nbQuiz,
  }) = _CategoryImpl;

  factory Category.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Category(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      desc: serializationManager.deserialize<String>(jsonSerialization['desc']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      nbQuiz:
          serializationManager.deserialize<int?>(jsonSerialization['nbQuiz']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String desc;

  int userId;

  int? nbQuiz;

  Category copyWith({
    int? id,
    String? name,
    String? desc,
    int? userId,
    int? nbQuiz,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'desc': desc,
      'userId': userId,
      if (nbQuiz != null) 'nbQuiz': nbQuiz,
    };
  }
}

class _Undefined {}

class _CategoryImpl extends Category {
  _CategoryImpl({
    int? id,
    required String name,
    required String desc,
    required int userId,
    int? nbQuiz,
  }) : super._(
          id: id,
          name: name,
          desc: desc,
          userId: userId,
          nbQuiz: nbQuiz,
        );

  @override
  Category copyWith({
    Object? id = _Undefined,
    String? name,
    String? desc,
    int? userId,
    Object? nbQuiz = _Undefined,
  }) {
    return Category(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      userId: userId ?? this.userId,
      nbQuiz: nbQuiz is int? ? nbQuiz : this.nbQuiz,
    );
  }
}
