
import 'package:flutter/material.dart';
import 'package:test1/series1.dart';
import 'package:test1/series2.dart';
import 'package:test1/series3.dart';
import 'package:test1/series4.dart';

class flutterdemo extends StatelessWidget {
  const flutterdemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      home: MyHomePage3(),
    );
  }
}


class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  State<MyHomePage3> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage3> {
  int _selectedIndex = 0;
  List<Widget> _listNaviagtion = <Widget>[
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title')),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2023/09/04/16/21/spider-8233129_1280.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Colors
                    .deepPurpleAccent, // Background color if image doesn't cover the entire header.
              ),
              accountName: Text(
                "toxsl",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "career.toxsl@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white30,
                child: Text(
                  "M",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) => FirstPage()));


              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdPage()));

              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
              ),
              title: const Text('Notification'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FourthPage()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.black45,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.call),
            label: 'calls',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex= index;
          });
        },
      ),

      body: _listNaviagtion.elementAt(_selectedIndex),
    );
  }
}
