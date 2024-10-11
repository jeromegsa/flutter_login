import 'package:flutter/material.dart';

// Page d'accueil après une connexion réussie
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    // final email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue  $email'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text("Connexion réussie !", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
