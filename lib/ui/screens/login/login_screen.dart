import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late bool _obscurePassword;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log-in'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: _buildLoginForm(),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                isDense: true,
              ),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              validator: _validateEmail,
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                isDense: true,
              ),
              obscureText: _obscurePassword,
              controller: _passwordController,
              validator: (val) => _validateRequired(val, 'Password'),
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.roboto(),
                  ),
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(100, 35)),
                ),
                ElevatedButton(
                  onPressed: _validateFormAndLogin,
                  child: Text(
                    "Log-in",
                    style: GoogleFonts.roboto(),
                  ),
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(100, 35)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _validateRequired(String? val, fieldName) {
    if (val == null || val == '') {
      return '$fieldName is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value == '') {
      return 'Email is required';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter valid email address';
    }
    return null;
  }

  void _validateFormAndLogin() {
    // Get form state from the global key
    var formState = _key.currentState;

    // check if form is valid
    if (formState!.validate()) {
      Navigator.pushNamed(context, home);
    } else {
    }
  }
}
