import 'package:flutter/material.dart';
import 'package:mobile/presentation/navigation/navigation_page.dart';
import 'package:mobile/presentation/profile/pages/account_settings.dart';
import 'package:mobile/presentation/profile/pages/edit_profile.dart';
import 'package:mobile/presentation/register/pages/register_page.dart';

import 'login/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team Bey',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const RegisterScreen(),
        '/navigation': (BuildContext context) => const NavigationPage(),
        EditProfilePage.route: (BuildContext context) =>
            const EditProfilePage(),
        AccountSettings.route: (BuildContext context) => const AccountSettings()
      },
    );
  }
}
