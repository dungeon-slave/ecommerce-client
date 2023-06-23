import 'package:flutter/material.dart';
import 'package:main_menu/src/ui/main_menu_screen.dart';

class MenuTabBar extends StatelessWidget {
  const MenuTabBar({super.key});

  static const tabStyle = TextStyle(
    fontSize: 25
  );

  MainMenuScreen getMenuState(String currFilter) {
    return MainMenuScreen(currFilter);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 31, 36),
          toolbarHeight: 0,
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 248, 193, 52),
            unselectedLabelColor: Color.fromARGB(255, 255, 255, 255),
            labelColor: Color.fromARGB(255, 248, 193, 52),
            isScrollable: true,

            tabs: <Widget>[
              Tab(
                child: Text(
                  'Burgers',
                  style: tabStyle,
                ),
              ),
              Tab(
                child: Text(
                  'Pizza',
                  style: tabStyle,
                ),
              ),
              Tab(
                child: Text(
                  'Drinks',
                  style: tabStyle,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            getMenuState('Burgers'),
            getMenuState('Pizza'),
            getMenuState('Drinks'),
          ],
        ),
      ),
    );
  }
}
