import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    title: 'Drawer App',
    initialRoute: '/home',
    routes: {
      //nemjó '/': (context) => Loading(),
      '/home': (context) => HomeScreen(),
    },
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

      body:
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 0,),
            child: Text('Kiemelt sorozatok', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black),),
          ),
          Padding( //Mozgó képek
            padding: const EdgeInsets.fromLTRB(0.0 , 10.0, 0, 0,),
            child: CarouselSlider(
              height: 150.0,
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Text('text $i', style: TextStyle(fontSize: 16.0),)

                    );
                  },
                );
              }).toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0.0 , 10.0, 0, 0,),
            child: Text('Frissen megosztott sorozatok', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.black ),),
          ),
          Padding( //Mozgó képek
            padding: const EdgeInsets.fromLTRB(0.0 , 10.0, 0, 0,),
            child: CarouselSlider(
              height: 150.0,
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Text('text $i', style: TextStyle(fontSize: 16.0),)

                    );
                  },
                );
              }).toList(),
            ),
          ),



          Drawer(
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
                CustomListTile(Icons.person, 'Profil', () { //Kattintásra át megy a bejelentkezésre!
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => bejelentkezes()),
                  );
                }),
                CustomListTile(Icons.settings, 'Beállítások', ()=>{}),
                CustomListTile(Icons.notifications, 'Sorozat Kategóriák', ()=>{}),
                CustomListTile(Icons.lock, 'Kijelentkezés', ()=>{}),
              ],
            ),
          ),
        ],
      ),
    );

  }
}