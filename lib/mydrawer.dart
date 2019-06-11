import 'package:flutter/material.dart';
import 'randomwords.dart';
import 'item_details.dart';
import 'item.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Color(0xFF307e73),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context){
                    return ItemDetails(isInTabletLayout: false,
                      item: new Item(
                        subtitle: 'prueba',
                        title: 'Prueba'
                      ),
                    );
                  })
                );
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context){
                    return RandomWords();
                  })
                );
              },
            ),
          ],
        ),
      );
  }
}