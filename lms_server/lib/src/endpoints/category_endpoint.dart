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
          message: 'Only admin user can create category',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    final existOrNot = await Category.db.findFirstRow(
      session,
      where: (cat) => cat.name.ilike(name.trim()),
    );
    if (existOrNot != null) {
      throw AppException(
          message: 'This name of category exist',
          errorType: ExceptionType.duplicateKeyException);
    }
    final Category createdCategory = await Category.db.insertRow(
        session, Category(name: name.trim(), desc: desc, userId: userId));
    return createdCategory;
  }

  Future<String> deleteCategroy(Session session, int id) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
          message: 'Only admin user can delete categroy',
          errorType: ExceptionType.unauthorizedAccessException);
    }
    final existOrNot = await Category.db.findById(session, id);
    if (existOrNot == null) {
      throw AppException(
          message: 'This category not  found',
          errorType: ExceptionType.notFound);
    }
    await Category.db.deleteRow(session, existOrNot);
    return 'Category deleted successfully = ${existOrNot.toString()}';
  }
}
