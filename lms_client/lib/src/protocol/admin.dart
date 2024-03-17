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

abstract class Admin extends _i1.SerializableEntity {
  Admin._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    this.categories,
  });

  factory Admin({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Category>? categories,
  }) = _AdminImpl;

  factory Admin.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Admin(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userInfoId: serializationManager
          .deserialize<int>(jsonSerialization['userInfoId']),
      userInfo: serializationManager
          .deserialize<_i2.UserInfo?>(jsonSerialization['userInfo']),
      categories: serializationManager
          .deserialize<List<_i3.Category>?>(jsonSerialization['categories']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  List<_i3.Category>? categories;

  Admin copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Category>? categories,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (categories != null)
        'categories': categories?.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}

class _Undefined {}

class _AdminImpl extends Admin {
  _AdminImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Category>? categories,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          categories: categories,
        );

  @override
  Admin copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? categories = _Undefined,
  }) {
    return Admin(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      categories: categories is List<_i3.Category>?
          ? categories
          : this.categories?.clone(),
    );
  }
}
