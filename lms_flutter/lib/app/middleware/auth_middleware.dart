import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/client_services.dart';

import '../routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (ClientServices.session.isSignedIn) {
      if (ClientServices.session.signedInUser!.scopeNames
          .contains(Roles.admin.name)) {
        return const RouteSettings(name: Routes.ADMIN);
      } else if (ClientServices.session.signedInUser!.scopeNames
          .contains(Roles.player.name)) {
        return const RouteSettings(name: Routes.PLAYER);
      }
    }
    return null;
  }
}
