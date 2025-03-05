import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_route_template/widgets.dart';
import 'package:flutter_route_template/theme/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomConvexBottomBar(
      currentIndex: 3, // Índice correspondente ao botão "Perfil"
      child: Scaffold(
        // appBar: AppBar(title: const Text('Perfil')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const ProfileAvatar(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const ProfileInfo(),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                isDarkMode
                    ? Colors.white70
                    : Theme.of(context).scaffoldBackgroundColor,
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  isDarkMode
                      ? const Color.fromRGBO(255, 255, 255, 0.5)
                      : const Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
            "https://avatars.githubusercontent.com/u/85801709?s=400&u=01cce0318ea853ce1a133699bc6b2af1919094d6&v=4",
          ),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileItem(title: "Nome:", value: "Carlos Felipe Araújo"),
        ProfileItem(title: "E-mail:", value: "carlosxfelipe@gmail.com"),
        ProfileItem(title: "Telefone:", value: "(85) 99950-2195"),
        ProfileItem(title: "Localização:", value: "Fortaleza, CE"),
        ProfileItem(title: "Data de Nascimento:", value: "03/10/1987"),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Theme.of(context).iconTheme.color,
          ),
          title: const Text("Configurações"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Theme.of(context).iconTheme.color,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.nightlight_round,
            color: Theme.of(context).iconTheme.color,
          ),
          title: const Text("Modo Escuro"),
          trailing: Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) => themeProvider.toggleTheme(value),
          ),
        ),
        ListTile(
          leading: Icon(Icons.share, color: Theme.of(context).iconTheme.color),
          title: const Text("Compartilhar App"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Theme.of(context).iconTheme.color,
          ),
          onTap: () {},
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
              elevation: 3,
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sair da Conta",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Icon(Icons.logout, size: 22, color: colorScheme.onPrimary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;
  const ProfileItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Divider(thickness: 1, color: Theme.of(context).dividerColor),
      ],
    );
  }
}
