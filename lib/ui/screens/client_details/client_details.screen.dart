import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/models/client.model.dart';

class ClientDatailsScreen extends StatelessWidget {
  final ClientModel client;
  ClientDatailsScreen({@required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _LabelValue(
              label: 'Name',
              value: client.name,
            ),
            SizedBox(height: 20),
            _LabelValue(
              label: 'E-mail',
              value: client.email,
            ),
            SizedBox(height: 20),
            _LabelValue(
              label: 'User Name',
              value: client.username,
            ),
            SizedBox(height: 20),
            _LabelValue(
              label: 'Web Site',
              value: client.website,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _LabelValue extends StatelessWidget {
  final String label, value;
  const _LabelValue({@required this.label, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label),
        SizedBox(width: 30),
        Text(value),
      ],
    );
  }
}
