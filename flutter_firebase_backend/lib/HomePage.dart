import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Flutter firebase backend"),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: ()=>debugPrint("Search pressed")),
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: ()=>debugPrint("Add pressed"))

        ],
      ),


      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: Text("Francisco Guzmán"),
                accountEmail: Text("paco-mgh@gmail.com"),
              decoration: new BoxDecoration(
                color: Colors.purple
              ),
            ),

            new ListTile(
              title: new Text("First page"),
              leading: new Icon(Icons.search, color: Colors.green,),
            ),

            new ListTile(
              title: new Text("Second Page"),
              leading: new Icon(Icons.add, color: Colors.purple,),
            ),

            new ListTile(
              title: new Text("Third page"),
              leading: new Icon(Icons.cake, color: Colors.redAccent,),
            ),

            new Divider(
              height: 10.0,
              color: Colors.black,
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close, color: Colors.red,),
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
