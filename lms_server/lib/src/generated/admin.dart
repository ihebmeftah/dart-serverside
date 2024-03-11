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

abstract class Admin extends _i1.TableRow {
  Admin._({
    int? id,
    required this.userInfoId,
    this.userInfo,
  }) : super(id);

  factory Admin({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
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
    );
  }

  static final t = AdminTable();

  static const db = AdminRepository._();

  int userInfoId;

  _i2.UserInfo? userInfo;

  @override
  _i1.Table get table => t;

  Admin copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
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
  static Future<List<Admin>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    AdminInclude? include,
  }) async {
    return session.db.find<Admin>(
      where: where != null ? where(Admin.t) : null,
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
  static Future<Admin?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    AdminInclude? include,
  }) async {
    return session.db.findSingleRow<Admin>(
      where: where != null ? where(Admin.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Admin?> findById(
    _i1.Session session,
    int id, {
    AdminInclude? include,
  }) async {
    return session.db.findById<Admin>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AdminTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Admin>(
      where: where(Admin.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Admin row, {
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
    Admin row, {
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
    Admin row, {
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
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Admin>(
      where: where != null ? where(Admin.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static AdminInclude include({_i2.UserInfoInclude? userInfo}) {
    return AdminInclude._(userInfo: userInfo);
  }

  static AdminIncludeList includeList({
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AdminTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminTable>? orderByList,
    AdminInclude? include,
  }) {
    return AdminIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Admin.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Admin.t),
      include: include,
    );
  }
}

class _Undefined {}

class _AdminImpl extends Admin {
  _AdminImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
        );

  @override
  Admin copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
  }) {
    return Admin(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
    );
  }
}

class AdminTable extends _i1.Table {
  AdminTable({super.tableRelation}) : super(tableName: 'admin') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: Admin.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
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
    return null;
  }
}

@Deprecated('Use AdminTable.t instead.')
AdminTable tAdmin = AdminTable();

class AdminInclude extends _i1.IncludeObject {
  AdminInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table get table => Admin.t;
}

class AdminIncludeList extends _i1.IncludeList {
  AdminIncludeList._({
    _i1.WhereExpressionBuilder<AdminTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Admin.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Admin.t;
}

class AdminRepository {
  const AdminRepository._();

  final attachRow = const AdminAttachRowRepository._();

  Future<List<Admin>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AdminTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminTable>? orderByList,
    _i1.Transaction? transaction,
    AdminInclude? include,
  }) async {
    return session.dbNext.find<Admin>(
      where: where?.call(Admin.t),
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Admin?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? offset,
    _i1.OrderByBuilder<AdminTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminTable>? orderByList,
    _i1.Transaction? transaction,
    AdminInclude? include,
  }) async {
    return session.dbNext.findFirstRow<Admin>(
      where: where?.call(Admin.t),
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Admin?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AdminInclude? include,
  }) async {
    return session.dbNext.findById<Admin>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Admin>> insert(
    _i1.Session session,
    List<Admin> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Admin>(
      rows,
      transaction: transaction,
    );
  }

  Future<Admin> insertRow(
    _i1.Session session,
    Admin row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Admin>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Admin>> update(
    _i1.Session session,
    List<Admin> rows, {
    _i1.ColumnSelections<AdminTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Admin>(
      rows,
      columns: columns?.call(Admin.t),
      transaction: transaction,
    );
  }

  Future<Admin> updateRow(
    _i1.Session session,
    Admin row, {
    _i1.ColumnSelections<AdminTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Admin>(
      row,
      columns: columns?.call(Admin.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Admin> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Admin>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Admin row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Admin>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AdminTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Admin>(
      where: where(Admin.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Admin>(
      where: where?.call(Admin.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AdminAttachRowRepository {
  const AdminAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    Admin admin,
    _i2.UserInfo userInfo,
  ) async {
    if (admin.id == null) {
      throw ArgumentError.notNull('admin.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $admin = admin.copyWith(userInfoId: userInfo.id);
    await session.dbNext.updateRow<Admin>(
      $admin,
      columns: [Admin.t.userInfoId],
    );
  }
}
