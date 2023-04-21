
import 'package:flutter/material.dart';

import 'Page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () =>
              Scaffold.of(context).openDrawer(), // <-- Opens drawer.
        );
      }),
      appBar: AppBar(
        actions: [],
        title: Text("Page1"),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.settings));
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Navigator.of(context, rootNavigator: true).push(
              //   MaterialPageRoute(
              //     builder: (_) => Page2(),
              //   ),
              // );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(),
                  ));
            },
            child: Text("Page1")),
      ),
    );
  }
}
