import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FriendsList extends StatelessWidget {
  //Fetch data dari API, mengambil 5 data random users
  final String apiUrl = "https://randomuser.me/api/?results=5";

  Future<List<dynamic>> fetchUsers() async {
    //Menyimpan ke variable result saat data sudah di fetch
    var result = await http.get(apiUrl);

    //Lalu JSON di decode
    return json.decode(result.body)['results'];
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      appBar: AppBar(
        title: Text('Friends List'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),

      body: Container(
        //Menjalankan fungsi fetch data
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(_age(snapshot.data[0]));
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    //Komponen card untuk setiap data user
                    return Card(
                      color: Colors.grey[800],
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    snapshot.data[index]['picture']['large'])),
                            title: Text(_name(snapshot.data[index]),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            subtitle: Text(_location(snapshot.data[index]),
                                style: TextStyle(color: Colors.grey)),
                            trailing: Text(_age(snapshot.data[index]),
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
