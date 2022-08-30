// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/navigation/bloc/navigation_bloc.dart';
import 'package:recipes_app/screens/add.recipe.screen.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/profile.screen.dart';
import 'package:recipes_app/screens/recipe.details.screen.dart';

final GlobalKey<NavigatorState> _nestedNavigatorKey =
    GlobalKey<NavigatorState>();

class NestedRouterDelegate extends RouterDelegate with ChangeNotifier {
  //int selectedIndex = 0;

  @override
  Future<bool> popRoute() async {
    print('popRoute NestedRouterDelegate');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, navState) {
        return Navigator(
          key: _nestedNavigatorKey,
          observers: [HeroController()],
          pages: [
            MaterialPage(
                key: ValueKey('HomePage'),
                child: HomeScreen()
              ),
            if (navState is NavigateToProfile)
              MaterialPage(
                key: ValueKey('ProfilePage'),
                child: ProfileScreen()
              ),
            if (navState is NavigatedToAdd)
              MaterialPage(
                key: ValueKey('AddRecipePage'),
                child: AddRecipeScreen(),
              ),
              if (navState is NavigateToDetais)
              MaterialPage(
                key: ValueKey('RecipeDetailsScreenPage'),
                child: RecipeDetailsScreen(),
              ),
          ],
          onPopPage: (route, result) {
            print('onPopPage NestedRouterDelegate');
            return false;
          },
        );
      },
    );
  }

  // We don't use named navigation so we don't use this
  @override
  Future<void> setNewRoutePath(configuration) async => null;

  // void onNewIndexSelected(int value) {
  //   selectedIndex = value;
  //   notifyListeners();
  // }
}
