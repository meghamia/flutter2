import 'package:flutter/material.dart';
import 'series7user.dart';

class UserDetailsPage extends StatelessWidget {
  final Data userData;

  UserDetailsPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Container(
          color: Colors.blue,
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 100,
                  height: 87,
                  child: Image.network(userData.avatar),
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 15),
                  Text('ID: ${userData.id}'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.perm_identity_sharp),
                  SizedBox(width: 15),
                  Text('Name: ${userData.firstName} ${userData.lastName}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_rounded),
                  SizedBox(height: 7),
                  Text('Email: ${userData.email}'),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
