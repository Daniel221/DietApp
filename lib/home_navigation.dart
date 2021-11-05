import 'package:diet_app/favorites.dart';
import 'package:diet_app/home_page.dart';
import 'package:diet_app/recipe_search.dart';
import 'package:diet_app/user_account.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  HomeNavigation({Key? key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _currentIndex = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) => setState(() => _currentIndex = value),
        children: [HomePage(), RecipeSearch(), Favorites(), UserAccount()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          _pageController.animateToPage(
            value,
            duration: Duration(microseconds: 300),
            curve: Curves.easeIn,
          );
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home Page',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Recipes',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'User',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
