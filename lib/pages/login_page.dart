import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false; // Updated line
  final List<String?> errors = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _signInWithEmailAndPassword() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: email!,
          password: password!,
        );

        if (userCredential.user != null) {
          (VxState.store as MyStore)
              .navigator
              .routeManager
              .push(Uri.parse(MyRoutes.homeRoute));
        }
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sign In Error"),
              content: Text(e.message ?? "An error occurred."),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sign In Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/ImageShop.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 123.0,
              horizontal: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                 'Rural4Us',
                  style: TextStyle(
                    color: Color.fromARGB(255, 150, 75, 20),
                    fontFamily: "Open Sans",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Escape the Ordinary and Immerse\nYourself in Rural Shopping with Rural4Us",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 150, 75, 20),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 150, 75, 0),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 150, 75, 0),
                              width: 2.0,
                            ),
                          ),
                          hintText: "Enter email",
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) { // Updated line
                            return "E-mail cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 150, 75, 0),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 150, 75, 0),
                              width: 2.0,
                            ),
                          ),
                          hintText: "Enter password",
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) { // Updated line
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be at least 6 characters";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 50.0),
                      Material(
                        color: Color.fromARGB(255, 150, 75, 0),
                        borderRadius: BorderRadius.circular(
                          changeButton ? 100 : 20,
                        ),
child: InkWell(
                          onTap: _signInWithEmailAndPassword,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 250 : 450,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: changeButton
                                ? Icon(Icons.done, color: Colors.white)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              (VxState.store as MyStore)
                                  .navigator
                                  .routeManager
                                  .push(Uri.parse(MyRoutes.signupRoute));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                color: Color.fromARGB(255, 150, 75, 20),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
