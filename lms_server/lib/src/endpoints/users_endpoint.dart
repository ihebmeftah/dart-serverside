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
      throw Exception(
          "User (Email / id ) not regisred in the user table created by auth module");
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
}
