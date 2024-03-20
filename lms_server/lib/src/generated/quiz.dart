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

abstract class Quiz extends _i1.TableRow {
  Quiz._({
    int? id,
    required this.name,
    this.desc,
    required this.categoryId,
    required this.userId,
    required this.points,
    this.question,
  }) : super(id);

  factory Quiz({
    int? id,
    required String name,
    String? desc,
    required int categoryId,
    required int userId,
    required int points,
    List<_i2.Question>? question,
  }) = _QuizImpl;

  factory Quiz.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Quiz(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      desc:
          serializationManager.deserialize<String?>(jsonSerialization['desc']),
      categoryId: serializationManager
          .deserialize<int>(jsonSerialization['categoryId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      points:
          serializationManager.deserialize<int>(jsonSerialization['points']),
      question: serializationManager
          .deserialize<List<_i2.Question>?>(jsonSerialization['question']),
    );
  }

  static final t = QuizTable();

  static const db = QuizRepository._();

  String name;

  String? desc;

  int categoryId;

  int userId;

  int points;

  List<_i2.Question>? question;

  @override
  _i1.Table get table => t;

  Quiz copyWith({
    int? id,
    String? name,
    String? desc,
    int? categoryId,
    int? userId,
    int? points,
    List<_i2.Question>? question,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (desc != null) 'desc': desc,
      'categoryId': categoryId,
      'userId': userId,
      'points': points,
      if (question != null)
        'question': question?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'categoryId': categoryId,
      'userId': userId,
      'points': points,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (desc != null) 'desc': desc,
      'categoryId': categoryId,
      'userId': userId,
      'points': points,
      if (question != null)
        'question': question?.toJson(valueToJson: (v) => v.allToJson()),
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
      case 'desc':
        desc = value;
        return;
      case 'categoryId':
        categoryId = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'points':
        points = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Quiz>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.db.find<Quiz>(
      where: where != null ? where(Quiz.t) : null,
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
  static Future<Quiz?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.db.findSingleRow<Quiz>(
      where: where != null ? where(Quiz.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Quiz?> findById(
    _i1.Session session,
    int id, {
    QuizInclude? include,
  }) async {
    return session.db.findById<Quiz>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuizTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Quiz>(
      where: where(Quiz.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Quiz row, {
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
    Quiz row, {
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
    Quiz row, {
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
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Quiz>(
      where: where != null ? where(Quiz.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static QuizInclude include({_i2.QuestionIncludeList? question}) {
    return QuizInclude._(question: question);
  }

  static QuizIncludeList includeList({
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    QuizInclude? include,
  }) {
    return QuizIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Quiz.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Quiz.t),
      include: include,
    );
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    required String name,
    String? desc,
    required int categoryId,
    required int userId,
    required int points,
    List<_i2.Question>? question,
  }) : super._(
          id: id,
          name: name,
          desc: desc,
          categoryId: categoryId,
          userId: userId,
          points: points,
          question: question,
        );

  @override
  Quiz copyWith({
    Object? id = _Undefined,
    String? name,
    Object? desc = _Undefined,
    int? categoryId,
    int? userId,
    int? points,
    Object? question = _Undefined,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      desc: desc is String? ? desc : this.desc,
      categoryId: categoryId ?? this.categoryId,
      userId: userId ?? this.userId,
      points: points ?? this.points,
      question:
          question is List<_i2.Question>? ? question : this.question?.clone(),
    );
  }
}

class QuizTable extends _i1.Table {
  QuizTable({super.tableRelation}) : super(tableName: 'quiz') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    desc = _i1.ColumnString(
      'desc',
      this,
    );
    categoryId = _i1.ColumnInt(
      'categoryId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    points = _i1.ColumnInt(
      'points',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString desc;

  late final _i1.ColumnInt categoryId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt points;

  _i2.QuestionTable? ___question;

  _i1.ManyRelation<_i2.QuestionTable>? _question;

  _i2.QuestionTable get __question {
    if (___question != null) return ___question!;
    ___question = _i1.createRelationTable(
      relationFieldName: '__question',
      field: Quiz.t.id,
      foreignField: _i2.Question.t.quiz,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    return ___question!;
  }

  _i1.ManyRelation<_i2.QuestionTable> get question {
    if (_question != null) return _question!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'question',
      field: Quiz.t.id,
      foreignField: _i2.Question.t.quiz,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    _question = _i1.ManyRelation<_i2.QuestionTable>(
      tableWithRelations: relationTable,
      table: _i2.QuestionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _question!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        desc,
        categoryId,
        userId,
        points,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'question') {
      return __question;
    }
    return null;
  }
}

@Deprecated('Use QuizTable.t instead.')
QuizTable tQuiz = QuizTable();

class QuizInclude extends _i1.IncludeObject {
  QuizInclude._({_i2.QuestionIncludeList? question}) {
    _question = question;
  }

  _i2.QuestionIncludeList? _question;

  @override
  Map<String, _i1.Include?> get includes => {'question': _question};

  @override
  _i1.Table get table => Quiz.t;
}

class QuizIncludeList extends _i1.IncludeList {
  QuizIncludeList._({
    _i1.WhereExpressionBuilder<QuizTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Quiz.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Quiz.t;
}

class QuizRepository {
  const QuizRepository._();

  final attach = const QuizAttachRepository._();

  final attachRow = const QuizAttachRowRepository._();

  Future<List<Quiz>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.dbNext.find<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Quiz?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.dbNext.findFirstRow<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Quiz?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.dbNext.findById<Quiz>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Quiz>> insert(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Quiz>(
      rows,
      transaction: transaction,
    );
  }

  Future<Quiz> insertRow(
    _i1.Session session,
    Quiz row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Quiz>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Quiz>> update(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.ColumnSelections<QuizTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Quiz>(
      rows,
      columns: columns?.call(Quiz.t),
      transaction: transaction,
    );
  }

  Future<Quiz> updateRow(
    _i1.Session session,
    Quiz row, {
    _i1.ColumnSelections<QuizTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Quiz>(
      row,
      columns: columns?.call(Quiz.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Quiz>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Quiz row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Quiz>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuizTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Quiz>(
      where: where(Quiz.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Quiz>(
      where: where?.call(Quiz.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class QuizAttachRepository {
  const QuizAttachRepository._();

  Future<void> question(
    _i1.Session session,
    Quiz quiz,
    List<_i2.Question> question,
  ) async {
    if (question.any((e) => e.id == null)) {
      throw ArgumentError.notNull('question.id');
    }
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }

    var $question = question.map((e) => e.copyWith(quiz: quiz.id)).toList();
    await session.dbNext.update<_i2.Question>(
      $question,
      columns: [_i2.Question.t.quiz],
    );
  }
}

class QuizAttachRowRepository {
  const QuizAttachRowRepository._();

  Future<void> question(
    _i1.Session session,
    Quiz quiz,
    _i2.Question question,
  ) async {
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }

    var $question = question.copyWith(quiz: quiz.id);
    await session.dbNext.updateRow<_i2.Question>(
      $question,
      columns: [_i2.Question.t.quiz],
    );
  }
}
