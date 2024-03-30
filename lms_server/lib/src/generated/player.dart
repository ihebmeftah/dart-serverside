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

abstract class Player extends _i1.TableRow {
  Player._({
    int? id,
    required this.userInfoId,
    this.userInfo,
    required this.password,
    this.totalPoint,
    this.quizesDone,
    required this.sounds,
    required this.notification,
    this.rank,
  }) : super(id);

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

  static final t = PlayerTable();

  static const db = PlayerRepository._();

  int userInfoId;

  _i2.UserInfo? userInfo;

  String password;

  int? totalPoint;

  int? quizesDone;

  bool sounds;

  bool notification;

  _i3.Rank? rank;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userInfoId': userInfoId,
      'password': password,
      'totalPoint': totalPoint,
      'quizesDone': quizesDone,
      'sounds': sounds,
      'notification': notification,
      'rank': rank,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.allToJson(),
      'password': password,
      if (totalPoint != null) 'totalPoint': totalPoint,
      if (quizesDone != null) 'quizesDone': quizesDone,
      'sounds': sounds,
      'notification': notification,
      if (rank != null) 'rank': rank?.allToJson(),
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
      case 'password':
        password = value;
        return;
      case 'totalPoint':
        totalPoint = value;
        return;
      case 'quizesDone':
        quizesDone = value;
        return;
      case 'sounds':
        sounds = value;
        return;
      case 'notification':
        notification = value;
        return;
      case 'rank':
        rank = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Player>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.db.find<Player>(
      where: where != null ? where(Player.t) : null,
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
  static Future<Player?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.db.findSingleRow<Player>(
      where: where != null ? where(Player.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Player?> findById(
    _i1.Session session,
    int id, {
    PlayerInclude? include,
  }) async {
    return session.db.findById<Player>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Player>(
      where: where(Player.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Player row, {
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
    Player row, {
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
    Player row, {
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
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Player>(
      where: where != null ? where(Player.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static PlayerInclude include({_i2.UserInfoInclude? userInfo}) {
    return PlayerInclude._(userInfo: userInfo);
  }

  static PlayerIncludeList includeList({
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    PlayerInclude? include,
  }) {
    return PlayerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Player.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Player.t),
      include: include,
    );
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

class PlayerTable extends _i1.Table {
  PlayerTable({super.tableRelation}) : super(tableName: 'player') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
    totalPoint = _i1.ColumnInt(
      'totalPoint',
      this,
    );
    quizesDone = _i1.ColumnInt(
      'quizesDone',
      this,
    );
    sounds = _i1.ColumnBool(
      'sounds',
      this,
    );
    notification = _i1.ColumnBool(
      'notification',
      this,
    );
    rank = _i1.ColumnSerializable(
      'rank',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnString password;

  late final _i1.ColumnInt totalPoint;

  late final _i1.ColumnInt quizesDone;

  late final _i1.ColumnBool sounds;

  late final _i1.ColumnBool notification;

  late final _i1.ColumnSerializable rank;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: Player.t.userInfoId,
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
        password,
        totalPoint,
        quizesDone,
        sounds,
        notification,
        rank,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

@Deprecated('Use PlayerTable.t instead.')
PlayerTable tPlayer = PlayerTable();

class PlayerInclude extends _i1.IncludeObject {
  PlayerInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table get table => Player.t;
}

class PlayerIncludeList extends _i1.IncludeList {
  PlayerIncludeList._({
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Player.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Player.t;
}

class PlayerRepository {
  const PlayerRepository._();

  final attachRow = const PlayerAttachRowRepository._();

  Future<List<Player>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.dbNext.find<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Player?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.dbNext.findFirstRow<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Player?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.dbNext.findById<Player>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Player>> insert(
    _i1.Session session,
    List<Player> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Player>(
      rows,
      transaction: transaction,
    );
  }

  Future<Player> insertRow(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Player>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Player>> update(
    _i1.Session session,
    List<Player> rows, {
    _i1.ColumnSelections<PlayerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Player>(
      rows,
      columns: columns?.call(Player.t),
      transaction: transaction,
    );
  }

  Future<Player> updateRow(
    _i1.Session session,
    Player row, {
    _i1.ColumnSelections<PlayerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Player>(
      row,
      columns: columns?.call(Player.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Player> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Player>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Player>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Player>(
      where: where(Player.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Player>(
      where: where?.call(Player.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlayerAttachRowRepository {
  const PlayerAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    Player player,
    _i2.UserInfo userInfo,
  ) async {
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $player = player.copyWith(userInfoId: userInfo.id);
    await session.dbNext.updateRow<Player>(
      $player,
      columns: [Player.t.userInfoId],
    );
  }
}
