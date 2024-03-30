import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ClientServices extends GetxService {
  /// Returns the singleton instance of the client services.
  static ClientServices get instance => Get.find<ClientServices>();

  /// Returns the singleton instance of the client.
  static Client get client => Get.find<ClientServices>()._client;

  /// Returns the singleton instance of the session manager.
  static SessionManager get session =>
      Get.find<ClientServices>()._sessionManager;

  late SessionManager _sessionManager;
  late Client _client;

  @override
  void onInit() async {
    // The android emulator does not have access to the localhost of the machine.
    // const ipAddress = '10.0.2.2'; // Android emulator ip for the host

    // On a real device replace the ipAddress with the IP address of your computer.
    final ipAddress = GetPlatform.isAndroid ? '10.0.2.2' : 'localhost';

    // Sets up a singleton client object that can be used to talk to the server from
    // anywhere in our app. The client is generated from your server code.
    // The client is set up to connect to a Serverpod running on a local server on
    // the default port. You will need to modify this to connect to staging or
    // production servers.
    _client = Client(
      'http://$ipAddress:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

    // The session manager keeps track of the signed-in state of the user. You
    // can query it to see if the user is currently signed in and get information
    // about the user.
    _sessionManager = SessionManager(caller: _client.modules.auth);
    await _sessionManager.initialize();
    super.onInit();
  }
}
