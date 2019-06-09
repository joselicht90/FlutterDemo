import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mydrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: Color(0xFF40a798),
        secondaryHeaderColor: Color(0xFF40a798),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  
  static final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final emailField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      'img/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0),
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(
                    height: 35.0,
                  ),
                  //Boton, lo hago aca para poder pasar
                  //el min widht del context
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFF40a798),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () { Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder: (context)=>MyHomePage())
                        );
                      },
                      child: Text("Login",
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:startup_namer/mydrawer.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   final appTitle = 'Drawer Demo';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prueba')),
      body: Center(child: Text('My Page!')),
      drawer: MyDrawer(),
    );
  }
}
