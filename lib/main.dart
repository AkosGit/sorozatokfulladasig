import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
      title: 'Drawer App',
      home: HomeScreen(),

  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text('Sorozatok Fulladásig'),
       backgroundColor: Colors.red[800],
     ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Colors.red[800],
              Colors.red[400],
            ])
        ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                        child: Image.asset('images/flutter-logo.svg', width: 100, height: 100 ,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text('Flutter', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                      )
                    ],
                  )
                )),
            CustomListTile(Icons.person, 'Profil', ()=>{}),
            CustomListTile(Icons.settings, 'Beállítások', ()=>{}),
            CustomListTile(Icons.notifications, 'Értesítések', ()=>{}),
            CustomListTile(Icons.lock, 'Kijelentkezés', ()=>{}),
  ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.orangeAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                child: Row(
                  children: <Widget>  [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(icon),
                  ),
                  Text(text, style: TextStyle(
                      fontSize: 18.0
                  ),),
        ],
                ),
              ),

              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}


