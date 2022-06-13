import 'package:flutter/material.dart';
import 'package:studenthelper/admin_screens/admin_home.dart';
import 'package:studenthelper/auth/login.dart';
import 'package:studenthelper/screens/home_page.dart';
import 'package:studenthelper/screens/pdfScreen.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int _currentPage = 0;

  List<Navi> _items = [
    Navi(
        icon: Icon(Icons.home),
        title: "Home",
        widget: MyHomePage(),
        naviKey: GlobalKey<NavigatorState>()),
    Navi(
        icon: Icon(Icons.menu),
        title: "Menu",
        widget: MyHomePage(),
        naviKey: GlobalKey<NavigatorState>()),
    Navi(
        icon: Icon(Icons.person),
        title: "Profile",
        widget: Login(),
        naviKey: GlobalKey<NavigatorState>()),
    Navi(
        icon: Icon(Icons.person),

        title: "Profile",
        widget: MyHomePage(),
        naviKey: GlobalKey<NavigatorState>())
  ];

  Widget _navigationTab({GlobalKey<NavigatorState> naviKey, Widget widget}) {
    return Navigator(
      key: naviKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => widget);
      },
    );
  }

  void _selectTab(int index) {
    if (index == _currentPage) {
      _items[index].naviKey.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = index;
      });
    }
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 8.0,
      backgroundColor: Colors.purple[900],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey[600],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPage,
      onTap: (int index) {
        _selectTab(index);
      },
      items: _items
          .map((e) => BottomNavigationBarItem(icon: e.icon, label:e.title ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _items[_currentPage].naviKey.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != 0) {
            _selectTab(1);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: IndexedStack(
            index: _currentPage,
            children: _items
                .map(
                    (e) => _navigationTab(naviKey: e.naviKey, widget: e.widget))
                .toList()),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }
}

class Navi {
  final Widget widget;
  final Widget icon;
  final String title;
  final GlobalKey<NavigatorState> naviKey;
  Navi({this.widget, this.icon, this.title, this.naviKey});
}