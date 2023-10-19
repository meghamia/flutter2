import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/user_details.dart';
import 'series7user.dart';

Future<GetUserModel> fetchGetUserModel(int page) async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));
  if (response.statusCode == 200) {
    return GetUserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class SwagerUser extends StatefulWidget {
  const SwagerUser({Key? key}) : super(key: key);

  @override
  State<SwagerUser> createState() => _SwagerUserState();
}

class _SwagerUserState extends State<SwagerUser> {
  late ScrollController _scrollController;
  List<Data> users = [];
  int currentPage = 1;
  int totalPages = 6;

  _SwagerUserState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    try {
      if (currentPage <= totalPages) {
        final userModel = await fetchGetUserModel(currentPage);
        if (userModel.data != null) {
          setState(() {
            users.addAll(userModel.data!);
            currentPage++;
            totalPages = userModel.totalPages!;
          });
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder<GetUserModel>(
        future: fetchGetUserModel(currentPage),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (snapshot.hasData) {
              final userModel = snapshot.data;
              if (userModel != null) {
                users.addAll(userModel.data!);
                currentPage++;
                totalPages = userModel.totalPages!;
              }
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: users.length + 1, // Add one to handle loading
              itemBuilder: (BuildContext context, int index) {
                if (index < users.length) {
                  final userData = users[index];
                  return Card(
                    color: Colors.blueGrey,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.network(userData.avatar),
                          ),
                          SizedBox(width: 16),
                          Text('ID: ${userData.id}', style: TextStyle(fontSize: 12)),
                          Spacer(),
                          IconButton(
                            color: Colors.brown,
                            icon: Icon(Icons.add, size: 16),
                            onPressed: () {
                              showDetails(userData);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  if (currentPage <= totalPages) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox();
                  }
                }
              },
            );
          }
        },
      ),
    );
  }
  void showDetails(Data userData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsPage(userData: userData),
      ),

    );
  }
}
