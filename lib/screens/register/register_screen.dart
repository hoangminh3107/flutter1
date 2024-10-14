import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  final emailController = TextEditingController();

  bool isShowPass = false;

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    passWordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                    controller: userNameController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: 'UserName'),
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: const Text('Register')),
                ),
              
              ],
            ),
          ),
        )),
      ),
    );
  }
}
