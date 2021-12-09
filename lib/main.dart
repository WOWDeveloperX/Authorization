import 'dart:ui';

import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;

  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text('Maxfit'), // (
//         showLogin
//        ?  Column(
//          children: <Widget>[
//            _form(
//            'login', _loginUser),
//        Padding(padding: EdgeInsets.all(10),
//        child : GestureDetector(child : Text ('ошибка'),
//        onTap:() {

//          setState(() {
// showLogin = false;

//          });
//        }
//        ),
//        )

//        ],

//       ),
          ),
        ),
      );
    }

    Widget _imput(Icon icon, String hint, TextEditingController controller,
        bool ebscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: ebscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                    data: IconThemeData(color: Colors.white), child: icon),
              )),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white,
        child: Text(text),
        onPressed: () {
          setState(() {
            func();
          });
        },
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 100),
                child: _imput(
                    Icon(Icons.email), 'EMAIL', _emailController, false)),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: _imput(
                  Icon(Icons.email), 'PASSWORD', _passwordController, true),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            )
          ],
        ),
      );
    }

    void _loginUser() {
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            _logo(),
            Column(
              children: <Widget>[
                _form('login', _loginUser),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                      child: Text('ошибка'),
                      onTap: () {
                        setState(() {
                          showLogin = false;
                        });
                      }),
                )
              ],
            ),
            _form('login', _loginUser),
          ],
        ));
  }
}

// (
//         showLogin
//        ?  Column(
//          children: <Widget>[
//            _form(
//            'login', _loginUser),
//        Padding(padding: EdgeInsets.all(10),
//        child : GestureDetector(child : Text ('ошибка'),
//        onTap:() {

//          setState(() {
// showLogin = false;

//          });
//        }
//        ),
//        )

//        ],

//       ),
