import 'package:flutter/material.dart';
import 'package:flutter_demo/homepage.dart';
import 'randomwords.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawer createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // column holds all the widgets in the drawer
      child: Column(
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(),
                Text('In list view'),
                Text('In list view too'),
              ],
            ),
          ),
          // This container holds the align
          Container(
              // This align moves the children to the bottom
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings')),
                      ListTile(
                          leading: Icon(Icons.help),
                          title: Text('Help and Feedback'))
                    ],
                  )
                )
              )
            )
        ],
      ),
    );
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'José Ignacio Licht',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            accountEmail: Text("20-35351995-7"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color(0xFF40a798),
              radius: 30.0,
              backgroundImage: AssetImage('img/avatar.png'),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/drawerHeader3.png'),
                  fit: BoxFit.cover),
              //color: Color(0xFF307e73),
            ),
          ),
          _buildTile('Inicio', Icon(Icons.home), MaterialPageRoute(builder: (BuildContext context){ return MyHomePage();})),
          Divider(),
          _buildTile('Item 2', Icon(Icons.monetization_on), MaterialPageRoute(builder: (BuildContext context){ return RandomWords();})),
          Divider(),
          // Container(
            
          //   alignment: Alignment.bottomCenter,
          //   child: Text('Cerrar Sesión'),
          // ),
          
          // Container(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Text('Cerrar Sesión'),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildTile(String titulo, Icon icono, MaterialPageRoute ruta) {
    return ListTile(
      leading: icono,
      title: Text(titulo),
      onTap: () {
        Navigator.push(context,ruta);
      },
    );
  }
}
