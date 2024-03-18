import 'package:lms_server/src/generated/protocol.dart';
import 'package:lms_server/src/scopes/users.scopes.dart';
import 'package:serverpod/server.dart';

class CategoryEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Category>> getCategory(Session session) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.admin) == true) {
      return await Category.db.find(
        session,
        where: (cat) => cat.userId.equals(userId),
      );
    } else {
      return await Category.db.find(session);
    }
  }

  Future<Category> createCategory(Session session,
      {required String name, required String desc}) async {
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
    final existOrNot = await Category.db.findFirstRow(
      session,
      where: (cat) => cat.name.equals(name),
    );
    if (existOrNot != null) {
      throw AppException(
          message: 'This name of category exist $name',
          errorType: ExceptionType.duplicateKeyException);
    }
    final Category createdCategory = await Category.db
        .insertRow(session, Category(name: name, desc: desc, userId: userId));
    return createdCategory;
  }
}
