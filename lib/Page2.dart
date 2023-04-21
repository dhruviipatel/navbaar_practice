
import 'package:flutter/material.dart';

import 'Page3.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page2")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => Page3(),
              //     ));

              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => Page3(),
                ),
              );
            },
            child: Text("Page2")),
      ),
    );
  }
}
