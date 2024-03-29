/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/module.dart' as _i2;

abstract class Player extends _i1.SerializableEntity {
  Player._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.password,
  });

  factory Player({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String password,
  }) = _PlayerImpl;

  factory Player.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Player(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userInfoId: serializationManager
          .deserialize<int>(jsonSerialization['userInfoId']),
      userInfo: serializationManager
          .deserialize<_i2.UserInfo?>(jsonSerialization['userInfo']),
      password: serializationManager
          .deserialize<String>(jsonSerialization['password']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String password;

  Player copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'password': password,
    };
  }
}

class _Undefined {}

class _PlayerImpl extends Player {
  _PlayerImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String password,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          password: password,
        );

  @override
  Player copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    String? password,
  }) {
    return Player(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      password: password ?? this.password,
    );
  }
}
