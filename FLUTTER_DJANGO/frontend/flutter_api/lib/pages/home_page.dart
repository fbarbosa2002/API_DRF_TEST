import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api/Constants/api.dart';
import 'package:flutter_api/Models/site.dart';
import 'package:flutter_api/Widgets/site_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_api/Widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int done = 0;
  int incomplete = 0;
  List<Site> mySites = [];
  bool isLoading = true;

  void _showModel() {
    int id = 3, national_site_code = 5;
    String name = "", country_iso = "", parish = "", status_site = "";
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Center(
              child: Column(
            children: [
              Text(
                "Add Your Site",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ID",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  setState(() {
                    id = int.parse(value);
                  });
                },
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                    print("Name : " + name);
                  });
                },
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "National Site Code",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  setState(() {
                    national_site_code = int.parse(value);
                  });
                },
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Country Iso",
                ),
                maxLength: 2,
                onChanged: (value) {
                  setState(() {
                    country_iso = value;
                  });
                },
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Parish",
                ),
                onChanged: (value) {
                  setState(() {
                    parish = value;
                  });
                },
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Status site",
                ),
                maxLength: 1,
                onChanged: (value) {
                  setState(() {
                    status_site = value;
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () => _postData(
                      id: id,
                      name: name,
                      national_site_code: national_site_code,
                      country_iso: country_iso,
                      parish: parish,
                      status_site: status_site),
                  child: Text("Add"))
            ],
          )),
        );
      },
    );
  }

  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      data.forEach((site) {
        Site aux = Site(
            id: site['id'] ?? 0,
            name: site['name'],
            national_site_code: site['national_site_code'] ?? 0,
            country_iso: site['country_iso'],
            parish: site['parish'],
            status_site: site['status_site']);
        mySites.add(aux);
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("ERROr is $e");
    }
  }

  void delete_site(String id) async {
    try {
      http.Response response = await http.delete(Uri.parse(api + "/" + id));
      fetchData();
      setState(() {
        mySites = [];
      });
    } catch (e) {
      print(e);
    }
  }

  void _postData(
      {dynamic id = null,
      String name = "",
      dynamic national_site_code = null,
      String country_iso = "",
      String parish = "",
      String status_site = ""}) async {
    try {
      http.Response response = await http.post(Uri.parse(api),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "id": id,
            "name": name,
            "national_site_code": national_site_code,
            "country_iso": country_iso,
            "parish": parish,
            "status_site": status_site
          }));
      if (kDebugMode) {
        print(id + national_site_code);
      }
      if (kDebugMode) {
        print(name + country_iso);
      }
      if (response.statusCode == 201) {
        setState(() {
          mySites = [];
        });
        fetchData();
      } else {
        print("ERROR");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001133),
      appBar: customAppBar(),
      body: ListView(
        children: mySites.map((e) {
          return SiteContainer(
              id: e.id,
              name: e.name,
              onPress: () => delete_site(e.id.toString()),
              national_site_code: e.national_site_code,
              country_iso: e.country_iso,
              parish: e.parish,
              status_site: e.status_site);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModel();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
