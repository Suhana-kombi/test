import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 80, bottom: 50),
              child: Text(
                'PROFILE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              height: 250,
              width: 250,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(251, 223, 122, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: 100,
                        height: 100,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Firstname LastName',
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('@username'),
                  ),
                  const Text('name@gmail.com')
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
