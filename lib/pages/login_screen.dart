import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(4)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Username',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(4)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.amber, 
                ),
                onPressed: () {
                  final username = _usernameController.text;
                  final password = _passwordController.text;
                  loginController.login(username, password);
                },
                child: loginController.isLoading.value
                    ? const Row(
                        children: [
                          Text('Please wait...'),
                          CircularProgressIndicator(),
                        ],
                      )
                    : const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
