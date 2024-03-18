/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class AppException extends _i1.SerializableEntity
    implements _i1.SerializableException {
  AppException._({
    required this.message,
    required this.errorType,
  });

  factory AppException({
    required String message,
    required _i2.ExceptionType errorType,
  }) = _AppExceptionImpl;

  factory AppException.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AppException(
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      errorType: serializationManager
          .deserialize<_i2.ExceptionType>(jsonSerialization['errorType']),
    );
  }

  String message;

  _i2.ExceptionType errorType;

  AppException copyWith({
    String? message,
    _i2.ExceptionType? errorType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }
}

class _AppExceptionImpl extends AppException {
  _AppExceptionImpl({
    required String message,
    required _i2.ExceptionType errorType,
  }) : super._(
          message: message,
          errorType: errorType,
        );

  @override
  AppException copyWith({
    String? message,
    _i2.ExceptionType? errorType,
  }) {
    return AppException(
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
    );
  }
}
