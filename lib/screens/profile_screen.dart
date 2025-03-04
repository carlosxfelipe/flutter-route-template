import 'package:flutter/material.dart';
import 'package:flutter_route_template/widgets/convex_bottom_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexBottomBar(
      currentIndex: 3, // Índice correspondente ao botão "Perfil"
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile Screen')),
        body: const Center(child: Text('Hello World!')),
      ),
    );
  }
}
