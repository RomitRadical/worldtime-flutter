import 'package:flutter/material.dart';
import 'package:worldtime/services/locations.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home', arguments: {
                    "location": locations[index]['location'],
                    "url": locations[index]['url']
                  });
                },
                leading: Image.network(locations[index]['flag']),
                title: Text(
                  locations[index]['location'],
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ));
  }
}
