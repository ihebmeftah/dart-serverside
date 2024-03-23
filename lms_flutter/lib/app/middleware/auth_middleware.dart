import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/initclient.dart';

import '../routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sessionManager.isSignedIn) {
      log(sessionManager.signedInUser!.scopeNames.toString());
      if (sessionManager.signedInUser!.scopeNames.contains(Roles.admin.name)) {
        return const RouteSettings(name: Routes.ADMIN);
      } else if (sessionManager.signedInUser!.scopeNames
          .contains(Roles.player.name)) {
        return const RouteSettings(name: Routes.PLAYER);
      }
    }
    return null;
  }
}
