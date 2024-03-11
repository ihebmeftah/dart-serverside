/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/users_endpoint.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'users': _i2.UsersEndpoint()
        ..initialize(
          server,
          'users',
          null,
        )
    };
    connectors['users'] = _i1.EndpointConnector(
      name: 'users',
      endpoint: endpoints['users']!,
      methodConnectors: {
        'createUsers': _i1.MethodConnector(
          name: 'createUsers',
          params: {
            'isAdmin': _i1.ParameterDescription(
              name: 'isAdmin',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i2.UsersEndpoint).createUsers(
            session,
            isAdmin: params['isAdmin'],
            userId: params['userId'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i3.Endpoints()..initializeEndpoints(server);
  }
}
