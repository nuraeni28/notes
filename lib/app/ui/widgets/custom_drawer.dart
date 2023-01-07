import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
            ),
          ),
        ));
  }
}
