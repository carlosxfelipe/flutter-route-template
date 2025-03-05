import 'package:flutter/material.dart';
import 'package:flutter_route_template/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomConvexBottomBar(
      currentIndex: 0, // Índice correspondente ao botão "Início"
      child: Scaffold(
        // appBar: AppBar(title: const Text('Home Screen')),
        appBar: CustomAppBar(),
        // body: const Center(child: Text('Hello World!')),
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, top: 16),
      child: Align(alignment: Alignment.topLeft, child: Text('Hello World!')),
    );
  }
}
