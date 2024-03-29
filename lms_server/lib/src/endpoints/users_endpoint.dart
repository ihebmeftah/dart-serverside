import 'package:lms_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';

import '../scopes/users.scopes.dart';

class UsersEndpoint extends Endpoint {
  Future<AuthenticationResponse> register(
    Session session, {
    required bool isAdmin,
    required String name,
    required String email,
    required String password,
  }) async {
    UserInfo? userInfo;
    userInfo = await Users.findUserByEmail(session, email);
    userInfo ??= await Users.findUserByIdentifier(session, email);
    if (userInfo != null) {
      throw AppException(
          message: "User already exist",
          errorType: ExceptionType.duplicateKeyException);
    }
    userInfo = UserInfo(
      userIdentifier: email,
      userName: name,
      email: email,
      blocked: false,
      created: DateTime.now().toUtc(),
      scopeNames: [isAdmin ? UsersScope.admin.name! : UsersScope.player.name!],
    );
    userInfo = await Users.createUser(session, userInfo, 'myAuthMethod');
    if (isAdmin) {
      await Admin.db.insertRow(
          session, Admin(userInfoId: userInfo!.id!, password: password));
    } else {
      await Player.db.insertRow(
          session, Player(userInfoId: userInfo!.id!, password: password));
    }
    final authToken =
        await session.auth.signInUser(userInfo.id!, 'myAuthMethod');
    return AuthenticationResponse(
      success: true,
      keyId: authToken.id,
      key: authToken.key,
      userInfo: userInfo,
    );
  }

  Future<AuthenticationResponse> login(
    Session session, {
    required String email,
    required String password,
  }) async {
    final userInfo = await Users.findUserByEmail(session, email);
    if (userInfo == null) {
      throw AppException(
          message: "User not exist", errorType: ExceptionType.notFound);
    }
    if (userInfo.scopes.contains(UsersScope.admin)) {
      final admin = await Admin.db.findById(session, userInfo.id!);
      if (admin!.password != password) {
        throw AppException(
          message: "Wrong password",
          errorType: ExceptionType.authenticationRequiredException,
        );
      }
    } else {
      final player = await Player.db.findById(session, userInfo.id!);
      if (player!.password != password) {
        throw AppException(
          message: "Wrong password",
          errorType: ExceptionType.authenticationRequiredException,
        );
      }
    }
    final authToken =
        await session.auth.signInUser(userInfo.id!, 'myAuthMethod');
    return AuthenticationResponse(
      success: true,
      keyId: authToken.id,
      key: authToken.key,
      userInfo: userInfo,
    );
  }
}
