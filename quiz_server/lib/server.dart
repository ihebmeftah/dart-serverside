import 'package:serverpod/serverpod.dart';

import 'package:quiz_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      // integrate with mail server
      print('Validation code: $validationCode');
      return true;
    },
    onUserCreated: (session, userInfo) async {
      await auth.Users.updateUserScopes(session, userInfo.id!, {
        Scope.admin,
      });
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      // integrate with mail server
      print('Validation code: $validationCode');
      return true;
    },
  ));

  // Start the server.
  await pod.start();
}
