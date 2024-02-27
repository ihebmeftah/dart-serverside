/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/module.dart' as _i2;
import 'protocol.dart' as _i3;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class User extends _i1.TableRow {
  User._({
    int? id,
    required this.userInfoId,
    this.userInfo,
    this.quiz,
  }) : super(id);

  factory User({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Quiz>? quiz,
  }) = _UserImpl;

  factory User.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return User(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userInfoId: serializationManager
          .deserialize<int>(jsonSerialization['userInfoId']),
      userInfo: serializationManager
          .deserialize<_i2.UserInfo?>(jsonSerialization['userInfo']),
      quiz: serializationManager
          .deserialize<List<_i3.Quiz>?>(jsonSerialization['quiz']),
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  int userInfoId;

  _i2.UserInfo? userInfo;

  List<_i3.Quiz>? quiz;

  @override
  _i1.Table get table => t;

  User copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Quiz>? quiz,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (quiz != null) 'quiz': quiz?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userInfoId': userInfoId,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.allToJson(),
      if (quiz != null) 'quiz': quiz?.toJson(valueToJson: (v) => v.allToJson()),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'userInfoId':
        userInfoId = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<User?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findSingleRow<User>(
      where: where != null ? where(User.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<User?> findById(
    _i1.Session session,
    int id, {
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where != null ? where(User.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static UserInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.QuizIncludeList? quiz,
  }) {
    return UserInclude._(
      userInfo: userInfo,
      quiz: quiz,
    );
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Quiz>? quiz,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          quiz: quiz,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? quiz = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      quiz: quiz is List<_i3.Quiz>? ? quiz : this.quiz?.clone(),
    );
  }
}

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i3.QuizTable? ___quiz;

  _i1.ManyRelation<_i3.QuizTable>? _quiz;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: User.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.QuizTable get __quiz {
    if (___quiz != null) return ___quiz!;
    ___quiz = _i1.createRelationTable(
      relationFieldName: '__quiz',
      field: User.t.id,
      foreignField: _i3.Quiz.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.QuizTable(tableRelation: foreignTableRelation),
    );
    return ___quiz!;
  }

  _i1.ManyRelation<_i3.QuizTable> get quiz {
    if (_quiz != null) return _quiz!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'quiz',
      field: User.t.id,
      foreignField: _i3.Quiz.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.QuizTable(tableRelation: foreignTableRelation),
    );
    _quiz = _i1.ManyRelation<_i3.QuizTable>(
      tableWithRelations: relationTable,
      table: _i3.QuizTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _quiz!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'quiz') {
      return __quiz;
    }
    return null;
  }
}

@Deprecated('Use UserTable.t instead.')
UserTable tUser = UserTable();

class UserInclude extends _i1.IncludeObject {
  UserInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.QuizIncludeList? quiz,
  }) {
    _userInfo = userInfo;
    _quiz = quiz;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.QuizIncludeList? _quiz;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'quiz': _quiz,
      };

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.dbNext.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.dbNext.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.dbNext.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  Future<void> quiz(
    _i1.Session session,
    User user,
    List<_i3.Quiz> quiz,
  ) async {
    if (quiz.any((e) => e.id == null)) {
      throw ArgumentError.notNull('quiz.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $quiz = quiz.map((e) => e.copyWith(userId: user.id)).toList();
    await session.dbNext.update<_i3.Quiz>(
      $quiz,
      columns: [_i3.Quiz.t.userId],
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    User user,
    _i2.UserInfo userInfo,
  ) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $user = user.copyWith(userInfoId: userInfo.id);
    await session.dbNext.updateRow<User>(
      $user,
      columns: [User.t.userInfoId],
    );
  }

  Future<void> quiz(
    _i1.Session session,
    User user,
    _i3.Quiz quiz,
  ) async {
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $quiz = quiz.copyWith(userId: user.id);
    await session.dbNext.updateRow<_i3.Quiz>(
      $quiz,
      columns: [_i3.Quiz.t.userId],
    );
  }
}
