import 'package:flutter/material.dart';
import 'package:test1/BMI.dart';
import 'package:test1/Drawerseries.dart';
import 'package:test1/GetFile.dart';
import 'package:test1/GridSeries.dart';
import 'package:test1/ModelDel.dart';
import 'package:test1/PostModel.dart';
import 'package:test1/cart_model.dart';
import 'package:test1/comments_model.dart';
import 'package:test1/imagecropper.dart';
import 'package:test1/post_model.dart';
import 'package:test1/response_model.dart';
import 'package:test1/series5.dart';
import 'package:test1/seriestofrom.dart';
import 'package:test1/user.dart';
import 'package:test1/users_model.dart';
import 'EditGrid.dart';
import 'MyBottomSheet.dart';


void main() {
  runApp(MyApp9());

}

class MyApp9 extends StatelessWidget {
  const MyApp9({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
                children:[
                  ElevatedButton(child: Text("click here"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Imagecropper()),),),
                  ElevatedButton(child: Text("Calculate BMI"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => BMIcalculator()),),),
                  ElevatedButton(child: Text("PostModel Grid view"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => PostModel1()),),),
                  ElevatedButton(child: Text("Sheet view"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ImageSelectionScreen()),),),
                  ElevatedButton(child: Text("grid"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => GridImage()),),),
                 /* ElevatedButton(
                    child: Text("Edit"),
                    onPressed:
                        ()=> Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GridConcept2()),

                    ),
                  ),*/
                  ElevatedButton(child: Text("EditPic"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp5()),),),
                  ElevatedButton(child: Text("drawer"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>flutterdemo()),)),
                  ElevatedButton(child: Text("store App"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>Laundrystore()),)),
                  ElevatedButton(child: Text("api"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Productbutton()),)),
                  ElevatedButton(child: Text("Cart"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Cartapi()),)),
                  OutlinedButton(
                      child: Text('user'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue ,
                      ),
                      onPressed: () =>   Navigator.push(context, MaterialPageRoute(builder: (context) => Userapi()),)),
                  OutlinedButton(child: Text('post'), style: ElevatedButton.styleFrom(backgroundColor: Colors.grey ,), onPressed: () =>   Navigator.push(context, MaterialPageRoute(builder: (context) => Postapi()),)),
                  ElevatedButton(child: Text("Comments"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Commentsapi()),)),
                  ElevatedButton(child: Text("Page"),onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SignPage()),)),
                  ElevatedButton(child: Text("swagger"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SwagerUser()),)),
                  ElevatedButton(child: Text("Delete"), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage9()),)),
                  ElevatedButton(
                      child: Text("Get"),
                      onPressed:
                          ()=> Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Getfile()
                        ),
                      )
                  ),
                ]
            )
        ),
      ),
    );
   }
}









