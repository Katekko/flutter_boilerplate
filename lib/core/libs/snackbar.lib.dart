import 'package:flutter/material.dart';

class SnackBarLib {
  static void showSuccessSnackBar({
    @required context,
    @required String text,
  }) {
    SnackBar _snackbar = SnackBar(
      backgroundColor: Color(0xFF10692E),
      content: Row(
        children: <Widget>[
          Icon(
            Icons.accessibility_new,
            size: 25,
          ),
          SizedBox(
            width: 20,
          ),
          Text(text),
        ],
      ),
      duration: Duration(seconds: 2),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Scaffold.of(context).showSnackBar(_snackbar),
    );
  }

  static void showWarningSnackBar({
    @required context,
    @required String text,
  }) {
    SnackBar _snackBar = SnackBar(
      backgroundColor: Colors.purple[900],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.warning),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(text),
          ),
        ],
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Scaffold.of(context).showSnackBar(
        _snackBar,
      ),
    );
  }

  static void showErrorSnackBar({
    @required context,
    @required String text,
  }) {
    SnackBar _snackBar = SnackBar(
      backgroundColor: Colors.red[800],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.error),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(text),
          ),
        ],
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Scaffold.of(context).showSnackBar(_snackBar),
    );
  }
}
