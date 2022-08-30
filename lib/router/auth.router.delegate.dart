// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:recipes_app/features/auth/bloc/auth_status_bloc.dart';
import 'package:recipes_app/router/nested.router.widget.dart';
import 'package:recipes_app/screens/screens.export.dart';

class AuthenticationRouterDelegate extends RouterDelegate with ChangeNotifier {
  //bool isAuthenticated = false;
  final GlobalKey<NavigatorState> navigatorKey;

  AuthenticationRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<bool> popRoute() async {
    print('popRoute AuthenticationRouterDelegate');
    MoveToBackground.moveTaskToBack();
    return true;
    //return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStatusBloc, AuthStatusState>(
      builder: (context, authState) {
        return Navigator(
          key: navigatorKey,
          observers: [HeroController()],
          pages: [
            MaterialPage(
              key: ValueKey('MyHomePage'), 
              child: LoginScreen()
                // MyAuthenticationWidget(
                //   onPressed: () {
                //     isAuthenticated = true;
                //     notifyListeners();
                //   },
                // ),
                ),
            if (authState.status.name == "authenticated")
              MaterialPage(
                key: ValueKey('NestedNavigatorPage'),
                child: NestedRouterWidget(),
              ),
          ],
          onPopPage: (route, result) {
            print('onPopPage AuthenticationRouterDelegate');
            if (!route.didPop(result)) return false;

           // isAuthenticated = false;
            //notifyListeners();
            return true;
          },
        );
      },
    );
  }

  // // We don't use named navigation so we don't use this
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
