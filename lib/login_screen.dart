import 'package:flutter/material.dart';
import 'package:restaurants_mobile_ui/forgot_password_screen.dart';
import 'package:restaurants_mobile_ui/home_screen.dart';
import 'package:restaurants_mobile_ui/main.dart';
import 'package:restaurants_mobile_ui/register_screen.dart';
import 'package:restaurants_mobile_ui/shared/auth/auth_provider.dart';
import 'package:restaurants_mobile_ui/shared/text_form_field_with_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _authenticate() async {
    if (_formKey.currentState!.validate() == false) return;

    bool loginSuccess = await AuthProvider()
        .doNewLogin(emailController.text, passwordController.text);

    if (loginSuccess && context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.none,
          content: Text(
            'Successfully logged in.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: successColor,
        ),
      );
    } else if (!loginSuccess && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.none,
          content: Text(
            'Login failed: Incorrect username and/or password.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Login'),
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                      const SizedBox(height: 25),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: primaryColor),
                        onPressed: _authenticate,
                        child: Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ForgotPasswordScreen()));
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(color: primaryColor, fontSize: 15),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RegisterScreen()));
                        },
                        child: Text(
                          'New User? Create Account',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
