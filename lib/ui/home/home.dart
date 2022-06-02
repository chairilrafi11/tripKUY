import 'package:flutter/material.dart';
import 'package:tripkuy/ui/component.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Component.textBold("Home"),
    );
  }
}