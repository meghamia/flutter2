import 'package:flutter/material.dart';
import 'package:http/http.dart';


class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);
  @override
  _SignPage createState() => _SignPage();
}


class _SignPage extends State<SignPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login(String email,password) async{
    try{
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {
            'email': email,
            'password': password
          }
      );
    if(response.statusCode==200){
      print('sucessful');
    }
    else{
      print('unsucessful');
    }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(),passwordcontroller.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: Text('Sign in'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
