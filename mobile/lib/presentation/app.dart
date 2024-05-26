import 'package:flutter/material.dart';
import 'package:mobile/presentation/feed/pages/project_details.page.dart';
import 'package:mobile/presentation/messages/pages/conversation_page.dart';
import 'package:mobile/presentation/messages/pages/messages_page.dart';
import 'package:mobile/presentation/navigation/navigation_page.dart';
import 'package:mobile/presentation/post_project/pages/post_project_page.dart';
import 'package:mobile/presentation/profile/pages/account_settings.dart';
import 'package:mobile/presentation/profile/pages/edit_profile.dart';
import 'package:mobile/presentation/register/pages/birthday_page.dart';
import 'package:mobile/presentation/register/pages/gender_page.dart';
import 'package:mobile/presentation/register/pages/prefrences_page.dart';
import 'package:mobile/presentation/register/pages/register_page.dart';
import 'package:mobile/presentation/register/pages/role_page.dart';

import 'login/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Team Bey',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const RegisterPage(),
        '/navigation': (BuildContext context) => const NavigationPage(),
        EditProfilePage.route: (BuildContext context) =>
            const EditProfilePage(),
        AccountSettings.route: (BuildContext context) =>
            const AccountSettings(),
        '/gender': (BuildContext context) => const GenderPage(),
        '/birthday': (BuildContext context) => const BirthdayPage(),
        PrefrencesPage.route: (BuildContext context) => const PrefrencesPage(),
        MessagesPage.route: (BuildContext context) => const MessagesPage(),
        ConversationPage.route: (BuildContext context) =>
            const ConversationPage(),
        PostProjectPage.route: (BuildContext context) =>
            const PostProjectPage(),
        RolePage.route: (BuildContext context) => const RolePage(),
      },
    );
  }
}
