import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../scopes/users.scopes.dart';

class RankEndpoint extends Endpoint {
  Future<List<Rank>> getRanks(Session session) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
        message: 'Only admin user can get ranks',
        errorType: ExceptionType.unauthorizedAccessException,
      );
    }
    return await Rank.db.find(session);
  }

  Future<Rank> createRank(
    Session session, {
    required String name,
    required int minpoints,
    required int maxpoints,
    required int level,
  }) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
        message: 'Only admin user can create rank',
        errorType: ExceptionType.unauthorizedAccessException,
      );
    }
    if ([1, 2, 3, 4, 5].any((element) => element == level) == false) {
      throw AppException(
        message: 'Level is required and should be 1 -> 5 max',
        errorType: ExceptionType.validationException,
      );
    }
    final createdRank = await Rank.db.insertRow(
        session,
        Rank(
            name: name,
            minpoints: minpoints,
            maxpoints: maxpoints,
            level: level));
    return createdRank;
  }

  Future<String> deleteRank(Session session, int id) async {
    final int? userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      throw AppException(
          message: 'This request required authintification of admin',
          errorType: ExceptionType.authenticationRequiredException);
    }
    final scopeOfUser = await session.scopes;
    if (scopeOfUser?.contains(UsersScope.player) == true) {
      throw AppException(
        message: 'Only admin user can create rank',
        errorType: ExceptionType.unauthorizedAccessException,
      );
    }
    final existOrNot = await Rank.db.findById(session, id);
    if (existOrNot == null) {
      throw AppException(
        message: 'Rank not found',
        errorType: ExceptionType.notFound,
      );
    }
    await Rank.db.deleteRow(session, existOrNot);
    return 'Rank deleted successfully = ${existOrNot.toString()}';
  }
}
