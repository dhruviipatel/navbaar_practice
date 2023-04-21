import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page3")),
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text("Page3")),
      ),
    );
  }
}
