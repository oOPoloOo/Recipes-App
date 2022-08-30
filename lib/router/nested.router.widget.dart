import 'package:flutter/material.dart';
import 'package:recipes_app/router/nested.router.delegate.dart';

class NestedRouterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final BackButtonDispatcher? parentDispatcher = Router.of(context).backButtonDispatcher;
 final BackButtonDispatcher ChildBackButtonDispatcher = parentDispatcher!.createChildBackButtonDispatcher();
    // final childBackButtonDispatcher =
    //     ChildBackButtonDispatcher(parentDispatcher);
    ChildBackButtonDispatcher.takePriority();
    return Router(
      routerDelegate: NestedRouterDelegate(),
      backButtonDispatcher: ChildBackButtonDispatcher,
    );
  }
}