/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum ExceptionType with _i1.SerializableEntity {
  userNotFoundException,
  authenticationRequiredException,
  unauthorizedAccessException,
  duplicateKeyException,
  notFound,
  notImplemented,
  badRequest,
  forbidden,
  internalServerError,
  validationException,
  notAcceptable,
  unprocessableEntity,
  conflict,
  preconditionFailed,
  preconditionRequired,
  tooManyRequests,
  gatewayTimeout,
  serviceUnavailable,
  badGateway,
  unknown;

  static ExceptionType? fromJson(String name) {
    switch (name) {
      case 'userNotFoundException':
        return userNotFoundException;
      case 'authenticationRequiredException':
        return authenticationRequiredException;
      case 'unauthorizedAccessException':
        return unauthorizedAccessException;
      case 'duplicateKeyException':
        return duplicateKeyException;
      case 'notFound':
        return notFound;
      case 'notImplemented':
        return notImplemented;
      case 'badRequest':
        return badRequest;
      case 'forbidden':
        return forbidden;
      case 'internalServerError':
        return internalServerError;
      case 'validationException':
        return validationException;
      case 'notAcceptable':
        return notAcceptable;
      case 'unprocessableEntity':
        return unprocessableEntity;
      case 'conflict':
        return conflict;
      case 'preconditionFailed':
        return preconditionFailed;
      case 'preconditionRequired':
        return preconditionRequired;
      case 'tooManyRequests':
        return tooManyRequests;
      case 'gatewayTimeout':
        return gatewayTimeout;
      case 'serviceUnavailable':
        return serviceUnavailable;
      case 'badGateway':
        return badGateway;
      case 'unknown':
        return unknown;
      default:
        return null;
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => toJson();
}
