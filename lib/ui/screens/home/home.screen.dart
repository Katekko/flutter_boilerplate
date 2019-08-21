import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/libs/snackbar.lib.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

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
            _ActionButton(
              label: 'Show SnackBar success',
              textSnackBar: 'Successsss',
              callback: SnackBarLib.showSuccessSnackBar,
            ),
            _ActionButton(
              label: 'Show SnackBar warning',
              textSnackBar: 'Warningggg',
              callback: SnackBarLib.showWarningSnackBar,
            ),
            _ActionButton(
              label: 'Show SnackBar error',
              textSnackBar: 'Errorrr',
              callback: SnackBarLib.showErrorSnackBar,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/test-screen'),
              child: Text('Navigate to another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final String textSnackBar;
  final Function callback;
  const _ActionButton({
    this.label,
    this.textSnackBar,
    this.callback,
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
