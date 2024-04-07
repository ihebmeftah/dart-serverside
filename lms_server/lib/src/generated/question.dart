/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Question extends _i1.TableRow {
  Question._({
    int? id,
    required this.question,
    required this.additionalInformation,
    required this.quiz,
    required this.points,
    this.options,
  }) : super(id);

  factory Question({
    int? id,
    required String question,
    required String additionalInformation,
    required int quiz,
    required int points,
    List<_i2.Option>? options,
  }) = _QuestionImpl;

  factory Question.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Question(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      question: serializationManager
          .deserialize<String>(jsonSerialization['question']),
      additionalInformation: serializationManager
          .deserialize<String>(jsonSerialization['additionalInformation']),
      quiz: serializationManager.deserialize<int>(jsonSerialization['quiz']),
      points:
          serializationManager.deserialize<int>(jsonSerialization['points']),
      options: serializationManager
          .deserialize<List<_i2.Option>?>(jsonSerialization['options']),
    );
  }

  static final t = QuestionTable();

  static const db = QuestionRepository._();

  String question;

  String additionalInformation;

  int quiz;

  int points;

  List<_i2.Option>? options;

  @override
  _i1.Table get table => t;

  Question copyWith({
    int? id,
    String? question,
    String? additionalInformation,
    int? quiz,
    int? points,
    List<_i2.Option>? options,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'question': question,
      'additionalInformation': additionalInformation,
      'quiz': quiz,
      'points': points,
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'question': question,
      'additionalInformation': additionalInformation,
      'quiz': quiz,
      'points': points,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'question': question,
      'additionalInformation': additionalInformation,
      'quiz': quiz,
      'points': points,
      if (options != null)
        'options': options?.toJson(valueToJson: (v) => v.allToJson()),
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
      case 'question':
        question = value;
        return;
      case 'additionalInformation':
        additionalInformation = value;
        return;
      case 'quiz':
        quiz = value;
        return;
      case 'points':
        points = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Question>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.find<Question>(
      where: where != null ? where(Question.t) : null,
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
  static Future<Question?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.findSingleRow<Question>(
      where: where != null ? where(Question.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Question?> findById(
    _i1.Session session,
    int id, {
    QuestionInclude? include,
  }) async {
    return session.db.findById<Question>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuestionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Question>(
      where: where(Question.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Question row, {
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
    Question row, {
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
    Question row, {
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
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Question>(
      where: where != null ? where(Question.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static QuestionInclude include({_i2.OptionIncludeList? options}) {
    return QuestionInclude._(options: options);
  }

  static QuestionIncludeList includeList({
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    QuestionInclude? include,
  }) {
    return QuestionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Question.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Question.t),
      include: include,
    );
  }
}

class _Undefined {}

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required String question,
    required String additionalInformation,
    required int quiz,
    required int points,
    List<_i2.Option>? options,
  }) : super._(
          id: id,
          question: question,
          additionalInformation: additionalInformation,
          quiz: quiz,
          points: points,
          options: options,
        );

  @override
  Question copyWith({
    Object? id = _Undefined,
    String? question,
    String? additionalInformation,
    int? quiz,
    int? points,
    Object? options = _Undefined,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      question: question ?? this.question,
      additionalInformation:
          additionalInformation ?? this.additionalInformation,
      quiz: quiz ?? this.quiz,
      points: points ?? this.points,
      options: options is List<_i2.Option>? ? options : this.options?.clone(),
    );
  }
}

class QuestionTable extends _i1.Table {
  QuestionTable({super.tableRelation}) : super(tableName: 'question') {
    question = _i1.ColumnString(
      'question',
      this,
    );
    additionalInformation = _i1.ColumnString(
      'additionalInformation',
      this,
    );
    quiz = _i1.ColumnInt(
      'quiz',
      this,
    );
    points = _i1.ColumnInt(
      'points',
      this,
    );
  }

  late final _i1.ColumnString question;

  late final _i1.ColumnString additionalInformation;

  late final _i1.ColumnInt quiz;

  late final _i1.ColumnInt points;

  _i2.OptionTable? ___options;

  _i1.ManyRelation<_i2.OptionTable>? _options;

  _i2.OptionTable get __options {
    if (___options != null) return ___options!;
    ___options = _i1.createRelationTable(
      relationFieldName: '__options',
      field: Question.t.id,
      foreignField: _i2.Option.t.question,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OptionTable(tableRelation: foreignTableRelation),
    );
    return ___options!;
  }

  _i1.ManyRelation<_i2.OptionTable> get options {
    if (_options != null) return _options!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'options',
      field: Question.t.id,
      foreignField: _i2.Option.t.question,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OptionTable(tableRelation: foreignTableRelation),
    );
    _options = _i1.ManyRelation<_i2.OptionTable>(
      tableWithRelations: relationTable,
      table: _i2.OptionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _options!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        question,
        additionalInformation,
        quiz,
        points,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'options') {
      return __options;
    }
    return null;
  }
}

@Deprecated('Use QuestionTable.t instead.')
QuestionTable tQuestion = QuestionTable();

class QuestionInclude extends _i1.IncludeObject {
  QuestionInclude._({_i2.OptionIncludeList? options}) {
    _options = options;
  }

  _i2.OptionIncludeList? _options;

  @override
  Map<String, _i1.Include?> get includes => {'options': _options};

  @override
  _i1.Table get table => Question.t;
}

class QuestionIncludeList extends _i1.IncludeList {
  QuestionIncludeList._({
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Question.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Question.t;
}

class QuestionRepository {
  const QuestionRepository._();

  final attach = const QuestionAttachRepository._();

  final attachRow = const QuestionAttachRowRepository._();

  Future<List<Question>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.dbNext.find<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Question?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.dbNext.findFirstRow<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Question?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.dbNext.findById<Question>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Question>> insert(
    _i1.Session session,
    List<Question> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Question>(
      rows,
      transaction: transaction,
    );
  }

  Future<Question> insertRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Question>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Question>> update(
    _i1.Session session,
    List<Question> rows, {
    _i1.ColumnSelections<QuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Question>(
      rows,
      columns: columns?.call(Question.t),
      transaction: transaction,
    );
  }

  Future<Question> updateRow(
    _i1.Session session,
    Question row, {
    _i1.ColumnSelections<QuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Question>(
      row,
      columns: columns?.call(Question.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Question> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Question>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Question>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuestionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Question>(
      where: where(Question.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Question>(
      where: where?.call(Question.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class QuestionAttachRepository {
  const QuestionAttachRepository._();

  Future<void> options(
    _i1.Session session,
    Question question,
    List<_i2.Option> option,
  ) async {
    if (option.any((e) => e.id == null)) {
      throw ArgumentError.notNull('option.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $option = option.map((e) => e.copyWith(question: question.id)).toList();
    await session.dbNext.update<_i2.Option>(
      $option,
      columns: [_i2.Option.t.question],
    );
  }
}

class QuestionAttachRowRepository {
  const QuestionAttachRowRepository._();

  Future<void> options(
    _i1.Session session,
    Question question,
    _i2.Option option,
  ) async {
    if (option.id == null) {
      throw ArgumentError.notNull('option.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $option = option.copyWith(question: question.id);
    await session.dbNext.updateRow<_i2.Option>(
      $option,
      columns: [_i2.Option.t.question],
    );
  }
}
