// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.grey[300],
          child: ListView(
            children: [
              Container(
                height: 30,
              ),
              CircleAvatar(
                child: Text("img"),
                minRadius: 80,
              ),
              Container(
                height: 20,
              ),
              Center(
                  child: Text(
                "Nombre del usuario",
                style: TextStyle(
                  fontSize: 22,
                ),
              )),
              Container(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Hello user"),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Welcome User",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Placeholder(
              fallbackHeight: 200,
            ),
            Container(height: 20),
            ListTile(
              tileColor: Colors.grey[200],
              leading: Icon(Icons.bar_chart),
              title: Text("Your progress"),
              subtitle: LinearProgressIndicator(
                value: 0.5,
                minHeight: 12,
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Container(height: 20),
            ListTile(
              tileColor: Colors.grey[200],
              leading: Icon(Icons.food_bank),
              title: Text("Today's recomendation"),
              subtitle: Text("Extravagant Salad"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                // TODO: direccionar a receta
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Recipe()),
                // );
              },
            ),
            Container(height: 20),
            ListTile(
              tileColor: Colors.grey[200],
              leading: Icon(Icons.food_bank_outlined),
              title: Text("Random recipe"),
              subtitle: Text("Soup"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                // TODO: direccionar a receta
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Recipe()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
