import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../env.sample.dart';
import '../../models/site.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<List<Site>> site;
  final employeeListKey = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    site = getEmployeeList();
  }

  Future<List<Site>> getEmployeeList() async {
    final response = await http.get("${Env.URL_PREFIX}");

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Site> employees = items.map<Site>((json) {
      return Site.fromJson(json);
    }).toList();

    return employees;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: employeeListKey,
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Center(
        child: FutureBuilder<List<Site>>(
          future: site,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render employee lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      data.ename,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
