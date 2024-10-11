import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/login_fom_state.dart';
import 'package:flutter_login/widgets/register_from_state.dart';

// Utilisez la classe correctement définie
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login';

    return MaterialApp(
      title: appTitle,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.login)),
                Tab(icon: Icon(Icons.person_add)),

              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MyCustomForm(),
              RegisterForm()
          
            ],
          ),
        ),
      ),
    );
  }
}
