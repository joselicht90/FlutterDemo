import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter_demo/models/LoginResponse.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'homepage.dart';
import 'package:flutter_demo/services/SeguridadService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      localizationsDelegates: [
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("es", "AR"),
      ],
      theme: ThemeData(
        primaryColor: Color(0xFF40a798),
        secondaryHeaderColor: Color(0xFF40a798),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _loading = false;
  static final passwordValue = TextEditingController();
  static final userValue = TextEditingController();

  static final TextStyle style =
      TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final emailField = TextField(
    controller: userValue,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final passwordField = TextField(
    controller: passwordValue,
    obscureText: true,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  List<Widget> buildForm(BuildContext context) {
    SingleChildScrollView body = SingleChildScrollView(
      padding: const EdgeInsets.only(top: 100.0),
      child: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
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
                    onPressed: () async {
                      print('cargando...');
                      setState(() {
                        _loading = true;
                      });
                      //Simulate a service call
                      print('submitting to backend...');
                      Future<LoginResponse> response =
                          login(userValue.text, passwordValue.text, 'SEG').then(
                              (LoginResponse value) {
                        if (value.codigo == '1') {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new MyHomePage()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(value.mensaje),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: Text('Cerrar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          _loading = false;
                                        });
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      }, onError: (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(e.toString()),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: Text('Cerrar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        _loading = false;
                                      });
                                    },
                                  ),
                                ],
                              );
                            });
                      });
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
    );
    var l = new List<Widget>();
    l.add(body);
    if (_loading) {
      var modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.3,
            child: const ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(),
          ),
        ],
      );
      l.add(modal);
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: buildForm(context),
      ),
    );
  }
}
