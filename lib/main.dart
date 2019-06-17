import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xfffb415b),
        fontFamily: 'Ubuntu',
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(
          top: 50.0,
          right: 20.0,
          left: 20.0,
          bottom: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/jedhi.jpg'),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              '.Dart',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 40.0,
            ),
            buildTextField('Email'),
            SizedBox(
              height: 20.0,
            ),
            buildTextField('Password'),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Esqueceu o password ?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Não tem conta?',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'CADASTRO',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20.0)),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: hintText == 'Email' ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == 'Password'
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == 'Password' ? _isHidden : false,
    );
  }

  Widget buildButtonContainer() {
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(colors: [
          Colors.black,
          Colors.redAccent,
        ], begin: Alignment.centerRight, end: Alignment.centerLeft),
      ),
      child: Center(
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
