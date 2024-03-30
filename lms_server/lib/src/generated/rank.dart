/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Rank extends _i1.TableRow {
  Rank._({
    int? id,
    required this.name,
    required this.minpoints,
    required this.maxpoints,
    required this.level,
  }) : super(id);

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

  static final t = RankTable();

  static const db = RankRepository._();

  String name;

  int minpoints;

  int maxpoints;

  int level;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'minpoints': minpoints,
      'maxpoints': maxpoints,
      'level': level,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'minpoints': minpoints,
      'maxpoints': maxpoints,
      'level': level,
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
      case 'name':
        name = value;
        return;
      case 'minpoints':
        minpoints = value;
        return;
      case 'maxpoints':
        maxpoints = value;
        return;
      case 'level':
        level = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Rank>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RankTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Rank>(
      where: where != null ? where(Rank.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<Rank?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RankTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Rank>(
      where: where != null ? where(Rank.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Rank?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Rank>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RankTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Rank>(
      where: where(Rank.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Rank row, {
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
    Rank row, {
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
    Rank row, {
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
    _i1.WhereExpressionBuilder<RankTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Rank>(
      where: where != null ? where(Rank.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static RankInclude include() {
    return RankInclude._();
  }

  static RankIncludeList includeList({
    _i1.WhereExpressionBuilder<RankTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RankTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RankTable>? orderByList,
    RankInclude? include,
  }) {
    return RankIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Rank.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Rank.t),
      include: include,
    );
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

class RankTable extends _i1.Table {
  RankTable({super.tableRelation}) : super(tableName: 'rank') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    minpoints = _i1.ColumnInt(
      'minpoints',
      this,
    );
    maxpoints = _i1.ColumnInt(
      'maxpoints',
      this,
    );
    level = _i1.ColumnInt(
      'level',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt minpoints;

  late final _i1.ColumnInt maxpoints;

  late final _i1.ColumnInt level;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        minpoints,
        maxpoints,
        level,
      ];
}

@Deprecated('Use RankTable.t instead.')
RankTable tRank = RankTable();

class RankInclude extends _i1.IncludeObject {
  RankInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Rank.t;
}

class RankIncludeList extends _i1.IncludeList {
  RankIncludeList._({
    _i1.WhereExpressionBuilder<RankTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Rank.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Rank.t;
}

class RankRepository {
  const RankRepository._();

  Future<List<Rank>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RankTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RankTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RankTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Rank>(
      where: where?.call(Rank.t),
      orderBy: orderBy?.call(Rank.t),
      orderByList: orderByList?.call(Rank.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Rank?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RankTable>? where,
    int? offset,
    _i1.OrderByBuilder<RankTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RankTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Rank>(
      where: where?.call(Rank.t),
      orderBy: orderBy?.call(Rank.t),
      orderByList: orderByList?.call(Rank.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Rank?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Rank>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Rank>> insert(
    _i1.Session session,
    List<Rank> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Rank>(
      rows,
      transaction: transaction,
    );
  }

  Future<Rank> insertRow(
    _i1.Session session,
    Rank row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Rank>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Rank>> update(
    _i1.Session session,
    List<Rank> rows, {
    _i1.ColumnSelections<RankTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Rank>(
      rows,
      columns: columns?.call(Rank.t),
      transaction: transaction,
    );
  }

  Future<Rank> updateRow(
    _i1.Session session,
    Rank row, {
    _i1.ColumnSelections<RankTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Rank>(
      row,
      columns: columns?.call(Rank.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Rank> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Rank>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Rank row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Rank>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RankTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Rank>(
      where: where(Rank.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RankTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Rank>(
      where: where?.call(Rank.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
