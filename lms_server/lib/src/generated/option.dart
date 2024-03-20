/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Option extends _i1.TableRow {
  Option._({
    int? id,
    required this.text,
    required this.isCorrect,
    required this.question,
  }) : super(id);

  factory Option({
    int? id,
    required String text,
    required bool isCorrect,
    required int question,
  }) = _OptionImpl;

  factory Option.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Option(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      isCorrect: serializationManager
          .deserialize<bool>(jsonSerialization['isCorrect']),
      question:
          serializationManager.deserialize<int>(jsonSerialization['question']),
    );
  }

  static final t = OptionTable();

  static const db = OptionRepository._();

  String text;

  bool isCorrect;

  int question;

  @override
  _i1.Table get table => t;

  Option copyWith({
    int? id,
    String? text,
    bool? isCorrect,
    int? question,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'isCorrect': isCorrect,
      'question': question,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'text': text,
      'isCorrect': isCorrect,
      'question': question,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'isCorrect': isCorrect,
      'question': question,
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
      case 'text':
        text = value;
        return;
      case 'isCorrect':
        isCorrect = value;
        return;
      case 'question':
        question = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Option>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OptionTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Option>(
      where: where != null ? where(Option.t) : null,
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
  static Future<Option?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OptionTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Option>(
      where: where != null ? where(Option.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Option?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Option>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Option>(
      where: where(Option.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Option row, {
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
    Option row, {
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
    Option row, {
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
    _i1.WhereExpressionBuilder<OptionTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Option>(
      where: where != null ? where(Option.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static OptionInclude include() {
    return OptionInclude._();
  }

  static OptionIncludeList includeList({
    _i1.WhereExpressionBuilder<OptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OptionTable>? orderByList,
    OptionInclude? include,
  }) {
    return OptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Option.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Option.t),
      include: include,
    );
  }
}

class _Undefined {}

class _OptionImpl extends Option {
  _OptionImpl({
    int? id,
    required String text,
    required bool isCorrect,
    required int question,
  }) : super._(
          id: id,
          text: text,
          isCorrect: isCorrect,
          question: question,
        );

  @override
  Option copyWith({
    Object? id = _Undefined,
    String? text,
    bool? isCorrect,
    int? question,
  }) {
    return Option(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      isCorrect: isCorrect ?? this.isCorrect,
      question: question ?? this.question,
    );
  }
}

class OptionTable extends _i1.Table {
  OptionTable({super.tableRelation}) : super(tableName: 'option') {
    text = _i1.ColumnString(
      'text',
      this,
    );
    isCorrect = _i1.ColumnBool(
      'isCorrect',
      this,
    );
    question = _i1.ColumnInt(
      'question',
      this,
    );
  }

  late final _i1.ColumnString text;

  late final _i1.ColumnBool isCorrect;

  late final _i1.ColumnInt question;

  @override
  List<_i1.Column> get columns => [
        id,
        text,
        isCorrect,
        question,
      ];
}

@Deprecated('Use OptionTable.t instead.')
OptionTable tOption = OptionTable();

class OptionInclude extends _i1.IncludeObject {
  OptionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Option.t;
}

class OptionIncludeList extends _i1.IncludeList {
  OptionIncludeList._({
    _i1.WhereExpressionBuilder<OptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Option.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Option.t;
}

class OptionRepository {
  const OptionRepository._();

  Future<List<Option>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OptionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Option>(
      where: where?.call(Option.t),
      orderBy: orderBy?.call(Option.t),
      orderByList: orderByList?.call(Option.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Option?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<OptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OptionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Option>(
      where: where?.call(Option.t),
      orderBy: orderBy?.call(Option.t),
      orderByList: orderByList?.call(Option.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Option?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Option>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Option>> insert(
    _i1.Session session,
    List<Option> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Option>(
      rows,
      transaction: transaction,
    );
  }

  Future<Option> insertRow(
    _i1.Session session,
    Option row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Option>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Option>> update(
    _i1.Session session,
    List<Option> rows, {
    _i1.ColumnSelections<OptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Option>(
      rows,
      columns: columns?.call(Option.t),
      transaction: transaction,
    );
  }

  Future<Option> updateRow(
    _i1.Session session,
    Option row, {
    _i1.ColumnSelections<OptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Option>(
      row,
      columns: columns?.call(Option.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Option> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Option>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Option row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Option>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Option>(
      where: where(Option.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Option>(
      where: where?.call(Option.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
