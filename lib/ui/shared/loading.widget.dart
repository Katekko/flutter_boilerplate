import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/blocs/loading.bloc.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;
  final bool canPopScope;
  final LoadingBloc _loadingBloc =
      BlocProvider.tag('HomeBloc').getBloc<LoadingBloc>();
  LoadingWidget({@required this.child, this.canPopScope = true});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _loadingBloc.loadingStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            return WillPopScope(
              onWillPop: () async => canPopScope,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    child,
                    ModalBarrier(
                      color: Colors.grey.withOpacity(.4),
                      dismissible: false,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          }
        }
        return child;
      },
    );
  }
}
