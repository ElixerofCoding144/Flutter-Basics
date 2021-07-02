import 'package:flutter/material.dart';
import 'package:flutter_catalog/util/routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeButton = false; //By default it will be false

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/greet.png",
                  width: 300,
                  height: 300,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Welcome on board! $name",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      //Username TextFormField
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username Required";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(
                              () {}); //this can be called only be written in Stateful Widgets
                          //This helps to render the changes in the current screen or widget
                          //calling in Stateless will give error
                        },
                      ),

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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Required";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6 ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      //--------------LOGIN BUTTON-------------------------------------------------->

                      //Could have used GestureDetector ---but it doesn't give
                      //feedback(i.e. no ripple effects will be displayed)
                      //on hitting the button
                      Material(
                        color: Colors.cyan,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          //used since Inkwell has the property of showing animations like ripple effects.
                          onTap: () => moveToHome(
                              context), //Shorthand operator(fat arrow) is used when
                          //(1.) you are returning & (2.) a single statement
                          //Created button using Animated container
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            //if you click the button , display the done icon
                            //else show the button with login text
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      )
                      //Login ElevatedButton
                      //ElevatedButton(
                      //  child: Text("Login"),
                      //style: TextButton.styleFrom(
                      //primary: Colors.white, minimumSize: Size(150, 40)),
                      //onPressed: () {
                      //Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //},
                      //)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
