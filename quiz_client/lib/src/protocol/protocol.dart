/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'enum/status.dart' as _i2;
import 'question.dart' as _i3;
import 'quiz.dart' as _i4;
import 'protocol.dart' as _i5;
import 'package:quiz_client/src/protocol/quiz.dart' as _i6;
export 'enum/status.dart';
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
    if (t == _i2.Status) {
      return _i2.Status.fromJson(data) as T;
    }
    if (t == _i3.Question) {
      return _i3.Question.fromJson(data, this) as T;
    }
    if (t == _i4.Quiz) {
      return _i4.Quiz.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Status?>()) {
      return (data != null ? _i2.Status.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Question?>()) {
      return (data != null ? _i3.Question.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Quiz?>()) {
      return (data != null ? _i4.Quiz.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i5.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i6.Quiz>) {
      return (data as List).map((e) => deserialize<_i6.Quiz>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Status) {
      return 'Status';
    }
    if (data is _i3.Question) {
      return 'Question';
    }
    if (data is _i4.Quiz) {
      return 'Quiz';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Status') {
      return deserialize<_i2.Status>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i3.Question>(data['data']);
    }
    if (data['className'] == 'Quiz') {
      return deserialize<_i4.Quiz>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
