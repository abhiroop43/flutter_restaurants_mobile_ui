import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/login_screen.dart';
import 'package:restaurants_mobile_ui/main.dart';
import 'package:restaurants_mobile_ui/shared/text_form_field_with_icon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  Future<void> _authenticate() async {
    if (_formKey.currentState!.validate() == false) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.none,
        content: Text(
          'Success',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Register New User'),
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: SizedBox(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image(image: AssetImage('assets/images/rms.png'))),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  TextFormFieldWithIcon(
                    key: const Key('email'),
                    icon: Icons.email,
                    label: 'Email',
                    textEditingController: emailController,
                  ),
                  TextFormFieldWithIcon(
                    key: const Key('password'),
                    icon: Icons.vpn_key,
                    label: 'Password',
                    textEditingController: passwordController,
                  ),
                  TextFormFieldWithIcon(
                    key: const Key('password_confirmation'),
                    icon: Icons.password,
                    label: 'Password Confirmation',
                    textEditingController: passwordConfirmationController,
                    confirmationController: passwordController,
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: primaryColor),
                    onPressed: _authenticate,
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    child: Text(
                      'Already have an account? Login instead',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
