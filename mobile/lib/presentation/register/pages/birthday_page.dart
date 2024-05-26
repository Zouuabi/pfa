import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/presentation/register/pages/prefrences_page.dart';

class BirthdayPage extends StatefulWidget {
  const BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  DateTime birth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          TextButton(
            onPressed: () {
              final args = ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
              args['birthDay'] = birth.toString();

              Navigator.of(context)
                  .pushNamed(PrefrencesPage.route, arguments: args);
            },
            child: Text(
              'Next',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.teal, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'My birthday',
              style: TextStyle(fontSize: 30),
            ),
            const Text('Your age will be public'),
            SizedBox(
                height: 300,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime(2000),
                    maximumDate: DateTime(2015),
                    onDateTimeChanged: (val) {
                      birth = val;
                    }))
          ],
        ),
      ),
    );
  }
}
