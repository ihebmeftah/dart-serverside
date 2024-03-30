/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Rank extends _i1.SerializableEntity {
  Rank._({
    this.id,
    required this.name,
    required this.minpoints,
    required this.maxpoints,
    required this.level,
  });

  factory Rank({
    int? id,
    required String name,
    required int minpoints,
    required int maxpoints,
    required int level,
  }) = _RankImpl;

  factory Rank.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Rank(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      minpoints:
          serializationManager.deserialize<int>(jsonSerialization['minpoints']),
      maxpoints:
          serializationManager.deserialize<int>(jsonSerialization['maxpoints']),
      level: serializationManager.deserialize<int>(jsonSerialization['level']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int minpoints;

  int maxpoints;

  int level;

  Rank copyWith({
    int? id,
    String? name,
    int? minpoints,
    int? maxpoints,
    int? level,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'minpoints': minpoints,
      'maxpoints': maxpoints,
      'level': level,
    };
  }
}

class _Undefined {}

class _RankImpl extends Rank {
  _RankImpl({
    int? id,
    required String name,
    required int minpoints,
    required int maxpoints,
    required int level,
  }) : super._(
          id: id,
          name: name,
          minpoints: minpoints,
          maxpoints: maxpoints,
          level: level,
        );

  @override
  Rank copyWith({
    Object? id = _Undefined,
    String? name,
    int? minpoints,
    int? maxpoints,
    int? level,
  }) {
    return Rank(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      minpoints: minpoints ?? this.minpoints,
      maxpoints: maxpoints ?? this.maxpoints,
      level: level ?? this.level,
    );
  }
}
