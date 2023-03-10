import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyModelListPage());

class MyModelListPage extends StatefulWidget {
  @override
  _MyModelListPageState createState() => _MyModelListPageState();
}

class _MyModelListPageState extends State<MyModelListPage> {
  List<dynamic> _myModels = [];

  @override
  void initState() {
    super.initState();
    _fetchMyModels();
  }

  Future<void> _fetchMyModels() async {
    final response = await http.get(Uri.parse('http://localhost:8000/table'));
    final json = jsonDecode(response.body);
    print(json);
    setState(() {
      _myModels = json;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Models'),
      ),
      body: ListView.builder(
        itemCount: _myModels.length,
        itemBuilder: (context, index) {
          final myModel = _myModels[index];
          return ListTile(
            title: Text(myModel['id']),
          );
        },
      ),
    );
  }
}
