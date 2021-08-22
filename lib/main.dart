import 'package:flutter/material.dart';
import 'package:game_card/friends-list.dart';

void main() => runApp(MaterialApp(
  home: GameCard(),
));

class GameCard extends StatefulWidget {
  @override
  //Inisialisasi state baru
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  //Variabel gamelevel (digunakan untuk state)
  int gamelevel = 0;

  //Fungsi saat tombol ditekan, akan memindah ke halaman friends-list
  Future navigateToFriendsPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FriendsList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      //AppBar dengan statis text
      appBar: AppBar(
        title: Text('Game Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),

      //Floating button, ketika diclik akan menambah value gamelevel (state)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            gamelevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Widget CircleAvatar untuk menampilkan image yang diambil dari folder assets
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile-pic.jpg'),
                radius: 40,
              ),
            ),

            //Widget Divider untuk membuat garis horizontal
            Divider(
              height: 90.0,
              color: Colors.grey,
            ),

            //Widget Text untuk menampilkan text statis nama
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            //Widget Text untuk menampilkan text statis isi nama
            Text(
              'Irvan Firmansyah',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),

            //Widget Text untuk menampilkan text statis Game Level
            Text(
              'CURRENT GAME LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            //Widget statefull untuk menampilkan isi dari variabel gamelevel (state)
            Text(
              '$gamelevel',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),

            Row(
              children: <Widget>[
                //Widget Icon untuk menampilkan icon email
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 10.0,
                ),

                //Widget Text untuk menampilkan isi email
                Text(
                  'irvanfirmansyah31@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),

            Divider(
              height: 100.0,
              color: Colors.grey,
            ),

            RaisedButton(
              color: Colors.amberAccent[200],
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text('List Friends',
                  style: TextStyle(color: Colors.black, fontSize: 18.0)),
              onPressed: () {
                //Pindah ke halaman friends list
                navigateToFriendsPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
