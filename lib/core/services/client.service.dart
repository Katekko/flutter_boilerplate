import 'package:flutter_boilerplate/core/libs/rest.lib.dart';
import 'package:flutter_boilerplate/core/models/client.model.dart';

class ClientService {
  RestLib _rest = RestLib();

  Future<List<ClientModel>> getClients() async {
    try {
      String url = '/users';
      List<dynamic> clientsJson = await _rest.get(url: url);
      List<ClientModel> clients = [];
      clientsJson.forEach(
        (client) => clients.add(
          ClientModel.fromJson(client),
        ),
      );
      return clients;
    } catch (err) {
      rethrow;
    }
  }
}
