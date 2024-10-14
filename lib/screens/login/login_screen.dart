import 'package:apptest/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passWordController = TextEditingController();
  final emailController = TextEditingController();

  bool isShowPass = false;

  final formKey = GlobalKey<FormState>();

  Future<void> fetchData() async {
    print('Fetching data...');
    await Future.delayed(
        Duration(seconds: 20)); // Giả lập việc gọi API mất 2 giây
    print('Data fetched');
  }

 Future<void> login() async {
    final url = Uri.parse('http://192.168.31.126:4000/api/login');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': emailController.text,
        'password': passWordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Data: $data');
    } else {
      print('Request failed with status: ${response.body.toString()}.');
    }
  }

  @override
  void dispose() {
    passWordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Not empty';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        border: InputBorder.none,
                        hintText: 'Email'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Not empty';
                      }
                      return null;
                    },
                    controller: passWordController,
                    obscureText: isShowPass,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isShowPass = !isShowPass;
                              });
                            },
                            icon: Icon(isShowPass
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16)),
                  child: TextButton(
                      onPressed: () async{
                        // if (formKey.currentState!.validate()) {}
                       await login();
                      },
                      child: const Text('Login')),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    child: const Text(
                      'Create account?',
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
