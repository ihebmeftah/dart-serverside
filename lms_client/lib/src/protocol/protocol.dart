/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'admin.dart' as _i2;
import 'category.dart' as _i3;
import 'enum/quiz_status.enum.dart' as _i4;
import 'enum/roles.enum.dart' as _i5;
import 'exceptions/appexception.dart' as _i6;
import 'exceptions/exceptiontype.enum.dart' as _i7;
import 'option.dart' as _i8;
import 'player.dart' as _i9;
import 'question.dart' as _i10;
import 'quiz.dart' as _i11;
import 'protocol.dart' as _i12;
import 'package:lms_client/src/protocol/category.dart' as _i13;
import 'package:lms_client/src/protocol/quiz.dart' as _i14;
import 'package:lms_client/src/protocol/player.dart' as _i15;
import 'package:lms_client/src/protocol/admin.dart' as _i16;
import 'package:serverpod_auth_client/module.dart' as _i17;
export 'admin.dart';
export 'category.dart';
export 'enum/quiz_status.enum.dart';
export 'enum/roles.enum.dart';
export 'exceptions/appexception.dart';
export 'exceptions/exceptiontype.enum.dart';
export 'option.dart';
export 'player.dart';
export 'question.dart';
export 'quiz.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Admin) {
      return _i2.Admin.fromJson(data, this) as T;
    }
    if (t == _i3.Category) {
      return _i3.Category.fromJson(data, this) as T;
    }
    if (t == _i4.QuizStatus) {
      return _i4.QuizStatus.fromJson(data) as T;
    }
    if (t == _i5.Roles) {
      return _i5.Roles.fromJson(data) as T;
    }
    if (t == _i6.AppException) {
      return _i6.AppException.fromJson(data, this) as T;
    }
    if (t == _i7.ExceptionType) {
      return _i7.ExceptionType.fromJson(data) as T;
    }
    if (t == _i8.Option) {
      return _i8.Option.fromJson(data, this) as T;
    }
    if (t == _i9.Player) {
      return _i9.Player.fromJson(data, this) as T;
    }
    if (t == _i10.Question) {
      return _i10.Question.fromJson(data, this) as T;
    }
    if (t == _i11.Quiz) {
      return _i11.Quiz.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Admin?>()) {
      return (data != null ? _i2.Admin.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Category?>()) {
      return (data != null ? _i3.Category.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.QuizStatus?>()) {
      return (data != null ? _i4.QuizStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Roles?>()) {
      return (data != null ? _i5.Roles.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AppException?>()) {
      return (data != null ? _i6.AppException.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.ExceptionType?>()) {
      return (data != null ? _i7.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Option?>()) {
      return (data != null ? _i8.Option.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.Player?>()) {
      return (data != null ? _i9.Player.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.Question?>()) {
      return (data != null ? _i10.Question.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.Quiz?>()) {
      return (data != null ? _i11.Quiz.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i12.Category>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Category>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.Quiz>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Quiz>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.Option>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Option>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i13.Category>) {
      return (data as List).map((e) => deserialize<_i13.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.Quiz>) {
      return (data as List).map((e) => deserialize<_i14.Quiz>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.Player>) {
      return (data as List).map((e) => deserialize<_i15.Player>(e)).toList()
          as dynamic;
    }
    if (t == List<_i16.Admin>) {
      return (data as List).map((e) => deserialize<_i16.Admin>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    try {
      return _i17.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i17.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Admin) {
      return 'Admin';
    }
    if (data is _i3.Category) {
      return 'Category';
    }
    if (data is _i4.QuizStatus) {
      return 'QuizStatus';
    }
    if (data is _i5.Roles) {
      return 'Roles';
    }
    if (data is _i6.AppException) {
      return 'AppException';
    }
    if (data is _i7.ExceptionType) {
      return 'ExceptionType';
    }
    if (data is _i8.Option) {
      return 'Option';
    }
    if (data is _i9.Player) {
      return 'Player';
    }
    if (data is _i10.Question) {
      return 'Question';
    }
    if (data is _i11.Quiz) {
      return 'Quiz';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i17.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Admin') {
      return deserialize<_i2.Admin>(data['data']);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i3.Category>(data['data']);
    }
    if (data['className'] == 'QuizStatus') {
      return deserialize<_i4.QuizStatus>(data['data']);
    }
    if (data['className'] == 'Roles') {
      return deserialize<_i5.Roles>(data['data']);
    }
    if (data['className'] == 'AppException') {
      return deserialize<_i6.AppException>(data['data']);
    }
    if (data['className'] == 'ExceptionType') {
      return deserialize<_i7.ExceptionType>(data['data']);
    }
    if (data['className'] == 'Option') {
      return deserialize<_i8.Option>(data['data']);
    }
    if (data['className'] == 'Player') {
      return deserialize<_i9.Player>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i10.Question>(data['data']);
    }
    if (data['className'] == 'Quiz') {
      return deserialize<_i11.Quiz>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
