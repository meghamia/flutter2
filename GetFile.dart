
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Getfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      home: First(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class First extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('My HomeScreen'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("Next Page"),
            onPressed: (){
             //Get.to(Second());
            },
          ),
        ),
      ),
    );
  }
}
class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back to first'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text('Go Back'),
            onPressed: (){
              //Get.to(First());
            },
          ),
        ),
      ),
    );
  }
}


