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

  Future<Category> getCategoryById(Session session, int id) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final category = await Category.db.findById(session, id);
    if (category == null || category.userId != userId) {
      throw AppException(
          message: 'Category not found', errorType: ExceptionType.notFound);
    }
    return category;
  }

  Future<void> checkCategoryByName(Session session, String name) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final category = await Category.db.findFirstRow(
      session,
      where: (cat) => cat.name.ilike(name.trim()),
    );
    if (category != null) {
      throw AppException(
          message: 'This name of category exist $name',
          errorType: ExceptionType.duplicateKeyException);
    }
  }

  Future<Category> updateCategory(Session session,
      {required int id, required String name, required String desc}) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    Category? category = await getCategoryById(session, id);
    category.name = name.trim();
    category.desc = desc.trim();
    await checkCategoryByName(session, name);
    category = await Category.db.updateRow(session, category);
    return category;
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
    await checkCategoryByName(session, name);
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
    final category = await getCategoryById(session, id);
    await Category.db.deleteRow(session, category);
    return 'Category deleted successfully = ${category.toString()}';
  }
}
