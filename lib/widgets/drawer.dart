import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Anmol"),
              accountEmail: Text("thelearninggeek07@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/acc.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: (Text(
              "Home",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            )),
          ),
          ListTile(
            leading: Icon(
              Icons.portrait,
              color: Colors.white,
            ),
            title: (Text(
              "Profile",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            )),
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.white,
            ),
            title: (Text(
              "Mail Me",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            )),
          ),
        ]),
      ),
    );
  }
}
