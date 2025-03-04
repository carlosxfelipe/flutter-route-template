import 'package:flutter/material.dart';
import 'package:flutter_route_template/widgets/convex_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexBottomBar(
      currentIndex: 0, // Índice correspondente ao botão "Início"
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: const Center(child: Text('Hello World!')),
      ),
    );
  }
}
