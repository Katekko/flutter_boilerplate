import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/blocs/client.bloc.dart';
import 'package:flutter_boilerplate/core/models/client.model.dart';
import 'package:flutter_boilerplate/ui/screens/client_details/client_details.screen.dart';
import 'package:flutter_boilerplate/ui/screens/home/home.screen.dart';

enum _RouteErrorType {
  inexistentRout,
  wrongArgumentType,
}

// NOTE: To do more animations transitions look at: https://medium.com/flutter-community/everything-you-need-to-know-about-flutter-page-route-transition-9ef5c1b32823
class NavigationLib {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return _ScaleRoute(
          page: BlocProvider(
            blocs: [Bloc((i) => ClientBloc())],
            child: HomeScreen(),
          ),
        );
      case '/client-details':
        if (args is ClientModel) {
          return _SlideToLeftRoute(
            page: ClientDatailsScreen(
              client: args,
            ),
          );
        } else {
          return _errorHandler(
            error: _RouteErrorType.wrongArgumentType,
            expectedValue: 'ClientModel',
            received: args,
          );
        }
        break;
      default:
        return _errorHandler(
          error: _RouteErrorType.inexistentRout,
          received: settings.name,
        );
    }
  }

  static Route<dynamic> _errorHandler({
    _RouteErrorType error,
    String expectedValue = '!!!Define a expected value!!!',
    dynamic received = '!!!Pass the value received!!!',
  }) {
    MaterialPageRoute _pageErro(
        {@required String title, @required String bodyText}) {
      return MaterialPageRoute(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Kat Error'),
            backgroundColor: Colors.purple[400],
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                bodyText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
        );
      });
    }

    switch (error) {
      case _RouteErrorType.wrongArgumentType:
        return _pageErro(
          title: 'Argument Error',
          bodyText:
              'Error while passing value to a new router, \n expected $expectedValue \n and received $received',
        );
        break;
      case _RouteErrorType.inexistentRout:
        return _pageErro(
          title: 'Route not found',
          bodyText:
              'This route that you passed doesn\'t exist! \n Route: $received',
        );
        break;
      default:
        return _pageErro(
          title: 'Mysterious Error',
          bodyText: 'Mysterious error while navigating to another screen!',
        );
        break;
    }
  }
}

class _SlideToLeftRoute extends PageRouteBuilder {
  final Widget page;
  _SlideToLeftRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class _ScaleRoute extends PageRouteBuilder {
  final Widget page;
  _ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child,
            );
          },
        );
}
