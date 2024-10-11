import 'package:flutter/material.dart';
import 'package:flutter_login/database/persondb.dart';
import 'package:flutter_login/screens/homepage.dart';
import 'package:flutter_login/widgets/login_fom_state.dart';

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Fonction de connexion avec validation
  void login() {
    setState(() {
      bool isValid = false;

      for (var person in people) {
        if (person.email == emailController.text &&
            person.password == passwordController.text) {
          isValid = true;
          // emailController.clear();
          break;
        }
      }

      if (isValid) {
       
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login réussi')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>HomePage(email: emailController.text,),
            // settings: RouteSettings(
            //   arguments: emailController.text,
            // ),
          ),
        );
        //  emailController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email ou mot de passe incorrect')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Titre "Login"

                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20), // Espacement après le titre
                // Ajout d'une image en haut du formulaire
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'images/image.jpg', // Chemin de l'image
                    height: 100,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),

                // Conteneur pour limiter la largeur du formulaire
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // Champ d'email stylé
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Entrez votre email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.email),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Merci de remplir votre email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Champ de mot de passe stylé
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Mot de passe",
                            hintText: "Entrez votre mot de passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Merci de remplir votre mot de passe';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Bouton de connexion stylé
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            backgroundColor: Colors.blue, // Couleur du bouton
                          ),
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        // Lien de récupération de mot de passe
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            // Action pour la récupération du mot de passe
                          },
                          child: const Text(
                            "Mot de passe oublié ?",
                            style: TextStyle(
                                color: Color.fromARGB(166, 33, 149, 243),
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
