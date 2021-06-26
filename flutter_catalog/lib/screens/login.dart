import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
            Text(
              "Welcome on board!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
              child: Column(
                children: [
                  //Username TextFormField
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                  ),
                  //
                  SizedBox(
                    height: 12.0,
                  ),
                  //Password TextFormfield
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  ElevatedButton(
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      print("Login Button Clicked");
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
