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
import 'protocol.dart' as _i3;

abstract class Player extends _i1.SerializableEntity {
  Player._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.password,
    this.totalPoint,
    this.quizesDone,
    required this.sounds,
    required this.notification,
    this.rank,
  });

  factory Player({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String password,
    int? totalPoint,
    int? quizesDone,
    required bool sounds,
    required bool notification,
    _i3.Rank? rank,
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
      totalPoint: serializationManager
          .deserialize<int?>(jsonSerialization['totalPoint']),
      quizesDone: serializationManager
          .deserialize<int?>(jsonSerialization['quizesDone']),
      sounds:
          serializationManager.deserialize<bool>(jsonSerialization['sounds']),
      notification: serializationManager
          .deserialize<bool>(jsonSerialization['notification']),
      rank: serializationManager
          .deserialize<_i3.Rank?>(jsonSerialization['rank']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String password;

  int? totalPoint;

  int? quizesDone;

  bool sounds;

  bool notification;

  _i3.Rank? rank;

  Player copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? password,
    int? totalPoint,
    int? quizesDone,
    bool? sounds,
    bool? notification,
    _i3.Rank? rank,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'password': password,
      if (totalPoint != null) 'totalPoint': totalPoint,
      if (quizesDone != null) 'quizesDone': quizesDone,
      'sounds': sounds,
      'notification': notification,
      if (rank != null) 'rank': rank?.toJson(),
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
    int? totalPoint,
    int? quizesDone,
    required bool sounds,
    required bool notification,
    _i3.Rank? rank,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          password: password,
          totalPoint: totalPoint,
          quizesDone: quizesDone,
          sounds: sounds,
          notification: notification,
          rank: rank,
        );

  @override
  Player copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    String? password,
    Object? totalPoint = _Undefined,
    Object? quizesDone = _Undefined,
    bool? sounds,
    bool? notification,
    Object? rank = _Undefined,
  }) {
    return Player(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      password: password ?? this.password,
      totalPoint: totalPoint is int? ? totalPoint : this.totalPoint,
      quizesDone: quizesDone is int? ? quizesDone : this.quizesDone,
      sounds: sounds ?? this.sounds,
      notification: notification ?? this.notification,
      rank: rank is _i3.Rank? ? rank : this.rank?.copyWith(),
    );
  }
}
