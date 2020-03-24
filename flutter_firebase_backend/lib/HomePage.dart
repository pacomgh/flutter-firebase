import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //for top post
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      Firestore.instance.collection("TopPost");
  //for body post
  StreamSubscription<QuerySnapshot>sdSubscription;
  List<DocumentSnapshot>sdSnapshot;
  CollectionReference sdCollectionReference = Firestore.instance.collection("BodyPost");

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });

    sdSubscription = sdCollectionReference.snapshots().listen((sddatasnap) {
      sdSnapshot = sddatasnap.documents;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("Flutter firebase backend"),
          backgroundColor: Colors.purple,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () => debugPrint("Search pressed")),
            new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () => debugPrint("Add pressed"))
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text("Francisco Guzmán"),
                accountEmail: Text("paco-mgh@gmail.com"),
                decoration: new BoxDecoration(color: Colors.purple),
              ),
              new ListTile(
                title: new Text("First page"),
                leading: new Icon(
                  Icons.search,
                  color: Colors.green,
                ),
              ),
              new ListTile(
                title: new Text("Second Page"),
                leading: new Icon(
                  Icons.add,
                  color: Colors.purple,
                ),
              ),
              new ListTile(
                title: new Text("Third page"),
                leading: new Icon(
                  Icons.cake,
                  color: Colors.redAccent,
                ),
              ),
              new Divider(
                height: 10.0,
                color: Colors.black,
              ),
              new ListTile(
                title: new Text("Close"),
                trailing: new Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
                height: 200,
                child: new ListView.builder(
                  itemCount: snapshot.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10.0,
                      margin: EdgeInsets.all(5.0),
                      child: new Container(
                        margin: EdgeInsets.all(10.0),
                        child: new Column(
                          children: <Widget>[
                            new ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: new Image.network(
                                snapshot[index].data["url"],
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            new SizedBox(
                              height: 10.0,
                            ),
                            new Text(
                              snapshot[index].data["title"],
                              style: TextStyle(fontSize: 19, color: Colors.purple),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
            ),
            new Container(
              height: MediaQuery.of(context).size.height,
              child: new ListView.builder(
                  itemCount: sdSnapshot.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 7.0,
                      margin: EdgeInsets.all(10.0),
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new CircleAvatar(
                                  child: new Text(sdSnapshot[index].data["title"][0]),
                                  backgroundColor: Colors.purple,
                                  foregroundColor: Colors.white,
                                ),
                                new SizedBox(width: 10.0,),
                                new Text(sdSnapshot[index].data["title"],
                                  style: TextStyle(fontSize: 15.0, color: Colors.purple),),
                              ],
                            ),
                            new SizedBox(height: 10.0,),
                            new Column(
                              children: <Widget>[],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),

          ],
        )
    );
  }
}
