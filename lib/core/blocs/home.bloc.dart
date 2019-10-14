import 'dart:core';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_boilerplate/core/models/client.model.dart';
import 'package:flutter_boilerplate/core/services/client.service.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  final _clientsController = BehaviorSubject<List<ClientModel>>();
  Observable<List<ClientModel>> get clientsStream => _clientsController.stream;

  void getAllClients() async {
    try {
      ClientService clientService = ClientService();
      List<ClientModel> clients = await clientService.getClients();
      _clientsController.sink.add(clients);
    } catch (err) {
      _clientsController.sink.addError(
        err.message.message ?? 'Error trying fetch clients!',
      );
    }
  }

  @override
  void dispose() {
    _clientsController.close();
    super.dispose();
  }
}
