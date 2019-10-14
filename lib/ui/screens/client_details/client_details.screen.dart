import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/models/client.model.dart';

class ClientDatailsScreen extends StatelessWidget {
  final ClientModel client;
  ClientDatailsScreen({@required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _LabelValueWidget(
              label: 'First Name:',
              value: client.first_name,
            ),
            SizedBox(height: 20),
            _LabelValueWidget(
              label: 'E-mail:',
              value: client.email,
            ),
            SizedBox(height: 20),
            _LabelValueWidget(
              label: 'Last Name:',
              value: client.last_name,
            ),
            SizedBox(height: 20),
            _AvatarWidget(avatar: client.avatar),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _LabelValueWidget extends StatelessWidget {
  final String label, value;
  const _LabelValueWidget({@required this.label, @required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * .2,
            child: Text(label),
          ),
          SizedBox(width: 30),
          Text(value),
        ],
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  final String avatar;
  const _AvatarWidget({this.avatar});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Avatar'),
        Image.network(avatar),
      ],
    );
  }
}
