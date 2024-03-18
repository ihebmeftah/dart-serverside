import 'package:lms_server/src/generated/protocol.dart';
import 'package:lms_server/src/scopes/users.scopes.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';

class UsersEndpoint extends Endpoint {
  Future<String> createUsers(
    Session session, {
    required bool isAdmin,
    required int userId,
  }) async {
    UserInfo? user = await Users.findUserByUserId(session, userId);
    if (user == null) {
      throw AppException(
          message:
              "User (Email / id ) not regisred in the user table created by auth module",
          errorType: ExceptionType.userNotFoundException);
    }
    if (isAdmin) {
      await Admin.db
          .insertRow(session, Admin(userInfoId: user.id!, userInfo: user));
      await Users.updateUserScopes(session, userId, {UsersScope.admin});
    } else {
      await Player.db
          .insertRow(session, Player(userInfoId: user.id!, userInfo: user));
      await Users.updateUserScopes(session, userId, {UsersScope.player});
    }
    return "User ${user.id} created succefully";
  }

  Future<List<Player>> getPlayers(Session session) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can create categroy',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    return Player.db
        .find(session, include: Player.include(userInfo: UserInfo.include()));
  }

  Future<List<Admin>> getAdmins(Session session) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can create categroy',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    return Admin.db
        .find(session, include: Admin.include(userInfo: UserInfo.include()));
  }

  ///(ADMIN , PLAYER)
  Future<List<int>> getUsersNumber(Session session) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can create categroy',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    final int numberPlayer = await Player.db.count(session);
    final int numberAdmin = await Player.db.count(session);
    return [numberAdmin, numberPlayer];
  }
}
