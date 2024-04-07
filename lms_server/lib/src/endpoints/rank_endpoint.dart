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
    required int maxpoints,
  }) async {
    int? minpoints;
    final ranks = await getRanks(session);
    if (ranks.isEmpty) {
      minpoints = 0;
    } else {
      minpoints = ranks.last.maxpoints + 1;
      if (maxpoints < ranks.last.maxpoints) {
        throw AppException(
          message:
              'Max points of the new rank must greater than $minpoints and  than max point of the last rank : ${ranks.last.maxpoints}',
          errorType: ExceptionType.validationException,
        );
      }
    }

    final createdRank = await Rank.db.insertRow(
        session,
        Rank(
          name: name,
          minpoints: minpoints,
          maxpoints: maxpoints,
        ));
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
