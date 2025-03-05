import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surface,
      title: const SearchAppBarContent(),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: theme.colorScheme.onSurface),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchAppBarContent extends StatelessWidget {
  const SearchAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar...',
          hintStyle: TextStyle(
            color: theme.colorScheme.onSurface.withAlpha(153),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: theme.colorScheme.onSurface.withAlpha(179),
          ),
          filled: true,
          fillColor: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: theme.colorScheme.onSurface),
      ),
    );
  }
}
