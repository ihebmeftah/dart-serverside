/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'admin.dart' as _i4;
import 'category.dart' as _i5;
import 'enum/roles.enum.dart' as _i6;
import 'exceptions/appexception.dart' as _i7;
import 'exceptions/exceptiontype.enum.dart' as _i8;
import 'option.dart' as _i9;
import 'player.dart' as _i10;
import 'question.dart' as _i11;
import 'quiz.dart' as _i12;
import 'protocol.dart' as _i13;
import 'package:lms_server/src/generated/category.dart' as _i14;
import 'package:lms_server/src/generated/question.dart' as _i15;
import 'package:lms_server/src/generated/quiz.dart' as _i16;
import 'package:lms_server/src/generated/player.dart' as _i17;
import 'package:lms_server/src/generated/admin.dart' as _i18;
export 'admin.dart';
export 'category.dart';
export 'enum/roles.enum.dart';
export 'exceptions/appexception.dart';
export 'exceptions/exceptiontype.enum.dart';
export 'option.dart';
export 'player.dart';
export 'question.dart';
export 'quiz.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'admin',
      dartName: 'Admin',
      schema: 'public',
      module: 'lms',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'admin_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'admin_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'admin_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'admin_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'category',
      dartName: 'Category',
      schema: 'public',
      module: 'lms',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'category_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'desc',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'category_fk_0',
          columns: ['userId'],
          referenceTable: 'admin',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'category_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'category_name_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'option',
      dartName: 'Option',
      schema: 'public',
      module: 'lms',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'option_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isCorrect',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'question',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'option_fk_0',
          columns: ['question'],
          referenceTable: 'question',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'option_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'text_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'text',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'player',
      dartName: 'Player',
      schema: 'public',
      module: 'lms',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'player_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'player_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'player_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'player_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'question',
      dartName: 'Question',
      schema: 'public',
      module: 'lms',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'question_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'question',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'additionalInformation',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'quiz',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'points',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'question_fk_0',
          columns: ['quiz'],
          referenceTable: 'quiz',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'question_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'question_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'question',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'quiz',
      dartName: 'Quiz',
      schema: 'public',
      module: 'lms',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'quiz_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'desc',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'categoryId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'points',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'quiz_fk_0',
          columns: ['categoryId'],
          referenceTable: 'category',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'quiz_fk_1',
          columns: ['userId'],
          referenceTable: 'admin',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'quiz_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'quiz_name_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i4.Admin) {
      return _i4.Admin.fromJson(data, this) as T;
    }
    if (t == _i5.Category) {
      return _i5.Category.fromJson(data, this) as T;
    }
    if (t == _i6.Roles) {
      return _i6.Roles.fromJson(data) as T;
    }
    if (t == _i7.AppException) {
      return _i7.AppException.fromJson(data, this) as T;
    }
    if (t == _i8.ExceptionType) {
      return _i8.ExceptionType.fromJson(data) as T;
    }
    if (t == _i9.Option) {
      return _i9.Option.fromJson(data, this) as T;
    }
    if (t == _i10.Player) {
      return _i10.Player.fromJson(data, this) as T;
    }
    if (t == _i11.Question) {
      return _i11.Question.fromJson(data, this) as T;
    }
    if (t == _i12.Quiz) {
      return _i12.Quiz.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.Admin?>()) {
      return (data != null ? _i4.Admin.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Category?>()) {
      return (data != null ? _i5.Category.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Roles?>()) {
      return (data != null ? _i6.Roles.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AppException?>()) {
      return (data != null ? _i7.AppException.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.ExceptionType?>()) {
      return (data != null ? _i8.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Option?>()) {
      return (data != null ? _i9.Option.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.Player?>()) {
      return (data != null ? _i10.Player.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.Question?>()) {
      return (data != null ? _i11.Question.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i12.Quiz?>()) {
      return (data != null ? _i12.Quiz.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i13.Category>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Category>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Quiz>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Quiz>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Option>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Option>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i14.Category>) {
      return (data as List).map((e) => deserialize<_i14.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.Question>) {
      return (data as List).map((e) => deserialize<_i15.Question>(e)).toList()
          as dynamic;
    }
    if (t == List<_i16.Quiz>) {
      return (data as List).map((e) => deserialize<_i16.Quiz>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.Player>) {
      return (data as List).map((e) => deserialize<_i17.Player>(e)).toList()
          as dynamic;
    }
    if (t == List<_i18.Admin>) {
      return (data as List).map((e) => deserialize<_i18.Admin>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.Admin) {
      return 'Admin';
    }
    if (data is _i5.Category) {
      return 'Category';
    }
    if (data is _i6.Roles) {
      return 'Roles';
    }
    if (data is _i7.AppException) {
      return 'AppException';
    }
    if (data is _i8.ExceptionType) {
      return 'ExceptionType';
    }
    if (data is _i9.Option) {
      return 'Option';
    }
    if (data is _i10.Player) {
      return 'Player';
    }
    if (data is _i11.Question) {
      return 'Question';
    }
    if (data is _i12.Quiz) {
      return 'Quiz';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Admin') {
      return deserialize<_i4.Admin>(data['data']);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i5.Category>(data['data']);
    }
    if (data['className'] == 'Roles') {
      return deserialize<_i6.Roles>(data['data']);
    }
    if (data['className'] == 'AppException') {
      return deserialize<_i7.AppException>(data['data']);
    }
    if (data['className'] == 'ExceptionType') {
      return deserialize<_i8.ExceptionType>(data['data']);
    }
    if (data['className'] == 'Option') {
      return deserialize<_i9.Option>(data['data']);
    }
    if (data['className'] == 'Player') {
      return deserialize<_i10.Player>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i11.Question>(data['data']);
    }
    if (data['className'] == 'Quiz') {
      return deserialize<_i12.Quiz>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Admin:
        return _i4.Admin.t;
      case _i5.Category:
        return _i5.Category.t;
      case _i9.Option:
        return _i9.Option.t;
      case _i10.Player:
        return _i10.Player.t;
      case _i11.Question:
        return _i11.Question.t;
      case _i12.Quiz:
        return _i12.Quiz.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'lms';
}
