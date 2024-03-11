import 'package:lms_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class UsersScope extends Scope {
  const UsersScope(String super.name);

  static final admin = UsersScope(Roles.admin.name);
  static final player = UsersScope(Roles.player.name);
}
