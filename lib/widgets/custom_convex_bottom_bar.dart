import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomConvexBottomBar extends StatelessWidget {
  final int currentIndex;
  final Widget child;

  const CustomConvexBottomBar({
    super.key,
    required this.currentIndex,
    required this.child,
  });

  Color darken(Color color, [double amount = 0.1]) {
    return Color.lerp(color, Colors.black, amount) ?? color;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final surfaceColor = theme.colorScheme.surface;
    final adjustedSurface =
        isDarkMode ? darken(surfaceColor, 0.1) : surfaceColor;

    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: ConvexAppBar(
        height: 60,
        style: TabStyle.react,
        backgroundColor: adjustedSurface,
        activeColor: theme.colorScheme.onSurface,
        color: theme.colorScheme.onSurface.withValues(alpha: 178),
        initialActiveIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;

          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              // context.go('/search');
              break;
            case 2:
              // context.go('/orders');
              break;
            case 3:
              context.go('/profile');
              break;
          }
        },
        items: const [
          TabItem(icon: Icons.home, title: 'Início'),
          TabItem(icon: Icons.search, title: 'Busca'),
          TabItem(icon: Icons.shopping_bag, title: 'Pedidos'),
          TabItem(icon: Icons.person, title: 'Perfil'),
        ],
      ),
    );
  }
}
