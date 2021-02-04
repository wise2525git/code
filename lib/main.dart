import "package:flutter/material.dart";
import "package:flutter_try/login.dart";

void main() => runApp(Index());

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "登入測試唷",
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        "/home": (context) => HomePage()
      },
    );
  }
}
