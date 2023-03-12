import 'package:flutter/material.dart';
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
  List<Site> mySites = [];
  bool isLoading = true;
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
      print(mySites.length);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("ERROr is $e");
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
        body: isLoading
            ? CircularProgressIndicator()
            : ListView(
                children: mySites.map((e) {
                  return SiteContainer(
                      id: e.id,
                      name: e.name,
                      national_site_code: e.national_site_code,
                      country_iso: e.country_iso,
                      parish: e.parish,
                      status_site: e.status_site);
                }).toList(),
              ));
  }
}
