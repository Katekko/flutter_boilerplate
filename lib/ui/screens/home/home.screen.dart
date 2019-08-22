import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/blocs/client.bloc.dart';
import 'package:flutter_boilerplate/core/libs/snackbar.lib.dart';
import 'package:flutter_boilerplate/core/models/client.model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _ActionSnackbarButton(
              label: 'Show SnackBar success',
              textSnackBar: 'Successsss',
              callback: SnackBarLib.showSuccessSnackBar,
            ),
            _ActionSnackbarButton(
              label: 'Show SnackBar warning',
              textSnackBar: 'Warningggg',
              callback: SnackBarLib.showWarningSnackBar,
            ),
            _ActionSnackbarButton(
              label: 'Show SnackBar error',
              textSnackBar: 'Errorrr',
              callback: SnackBarLib.showErrorSnackBar,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/test-screen'),
              child: Text('Navigate to another page'),
            ),
            _TotalClientsText(),
          ],
        ),
      ),
    );
  }
}

class _ActionSnackbarButton extends StatelessWidget {
  final String label;
  final String textSnackBar;
  final Function callback;
  const _ActionSnackbarButton({
    @required this.label,
    @required this.textSnackBar,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => callback(
        context: context,
        text: textSnackBar,
      ),
      child: Text(label),
    );
  }
}

class _TotalClientsText extends StatelessWidget {
  final ClientBloc _clientBloc = BlocProvider.getBloc<ClientBloc>();

  @override
  Widget build(BuildContext context) {
    _clientBloc.getAllClients();
    return StreamBuilder<List<ClientModel>>(
      stream: _clientBloc.clientsStream,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${snapshot.data.length.toString()} clients',
                style: TextStyle(fontSize: 22),
              ),
              RaisedButton(
                onPressed: () {
                  // TODO: Choose one client here. e.g snapshot.data[0]
                  Navigator.of(context)
                      .pushNamed('/client-details', arguments: null);
                },
                child: Text('Navigate to client details'),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          SnackBarLib.showErrorSnackBar(
            context: context,
            text: snapshot.error,
          );
          return Center(
            child: Text('Error trying fetchClients'),
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('0', style: TextStyle(fontSize: 22)),
            SizedBox(width: 30),
            CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}
