import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: new Text('Firebase backend app'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: ()=> debugPrint('search')),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: ()=> debugPrint('add'))
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('Paco G'),
                accountEmail: new Text('fmgh@gmail.com'),
              decoration: new BoxDecoration(
                  color: Colors.purple
              ),
            ),

            new ListTile(
              title: new Text('First element'),
              leading: new Icon(Icons.search, color: Colors.green)
            ),

            new ListTile(
              title: new Text('Second element'),
              leading: new Icon(Icons.add, color: Colors.black)
            ),

            new ListTile(
              title: new Text('Third element'),
              leading: new Icon(Icons.cake, color: Colors.pink)
            ),

            new Divider(
              height: 10.0,
                color: Colors.black,
            ),
            new ListTile(
              title: new Text('Close'),
              trailing: new Icon(Icons.close, color: Colors.red),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
