import 'package:lms_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod/serverpod.dart';

import '../scopes/users.scopes.dart';

abstract class EndpointUtils {
  EndpointUtils._();
  static Future<int> isSiginOrThrowException(Session session) async {
    final int? userId = await session.auth.authenticatedUserId;
    final bool isSignedIn = await session.isUserSignedIn;
    if (userId == null || !isSignedIn) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    return userId;
  }

  static Future<bool> isAdminOrThrowException(Session session) async {
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can create category',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    return true;
  }
}
