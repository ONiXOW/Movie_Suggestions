import 'package:flutter/material.dart';

import 'login_body.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginBody();
  }
}
