import 'package:flutter/material.dart';

import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };
  final List<Widget> _widgetOptions = <Widget>[
    const Page1(),
    const Page2(),
    const Page3()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () =>
              Scaffold.of(context).openDrawer(), // <-- Opens drawer.
        );
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(20)),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonBar(
                  text: "Home",
                  icon: Icons.home_outlined,
                  selected: _selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  }),
              IconButtonBar(
                  text: "Category",
                  icon: Icons.category_outlined,
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  }),
              IconButtonBar(
                  text: "Search",
                  icon: Icons.search,
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  }),
            ],
          ),
        ),
      ),

      // BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'School',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
      body: buildNavigator(),
    );
  }

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_selectedIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (_) => _widgetOptions.elementAt(_selectedIndex));
      },
    );
  }
}

class IconButtonBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  const IconButtonBar({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          icon: Icon(icon,
              size: 25, color: selected ? Colors.white : Colors.black),
        ),
        Text(
          text,
          style: TextStyle(
              height: 0.001,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4,
              color: selected ? Colors.white : Colors.black),
        )
      ],
    );
  }
}
