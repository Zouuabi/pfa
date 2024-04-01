import 'package:flutter/material.dart';
import 'package:mobile/presentation/login/pages/login_page.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  static const String route = '/account-settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Account Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Card(
              child: ListTile(
                title: Text('About Teambey'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Give us a feedback'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Delete account'),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.route,
                      (route) {
                    /// todo: the behavior needs to be validated by debuging

                    return route.settings.name == LoginPage.route;
                  });
                },
                child: const Text('Log out')),
            const SizedBox(height: 20),
            Text(
              '® TeamBey${DateTime.now().year}',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
