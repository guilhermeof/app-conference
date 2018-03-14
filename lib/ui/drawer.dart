import 'package:flutter/material.dart';

class NewDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new Drawer(
        child: new ListView(
          padding: new EdgeInsets.all(0.0),
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Guilherme Oliveira"),
              accountEmail: new Text("guilhermeoliveira.f11@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage("https://avatars3.githubusercontent.com/u/19732467?s=460&v=4"),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://coolwallpapers.site/public/uploads/large/115144681634de89jtyivdsnse40ymffrqjopsuhkwsboi1ylhb7i0fiinsxjrp253rmun1mh20vwxqtxzhwjln4zzwpgupbhiqzoq6e4ykwz8l.jpg")
                )
              ),
            ),
            new ListTile(
              title: new Text("Ações", style: new TextStyle(color: Colors.grey),),
            ),
            new ListTile(
              title: new Text("First Page"),
              trailing: new Icon(Icons.arrow_upward)
            ),
            new ListTile(
              title: new Text("Second Page"),
              trailing: new Icon(Icons.arrow_right)
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
   }
}