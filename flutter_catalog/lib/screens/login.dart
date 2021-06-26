import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("You are inside Login",
            style: TextStyle(
              fontSize: 40,
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
