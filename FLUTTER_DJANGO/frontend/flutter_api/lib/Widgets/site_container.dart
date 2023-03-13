import 'package:flutter/material.dart';

class SiteContainer extends StatelessWidget {
  final int id;
  final String name;
  final Function onPress;
  final int national_site_code;
  final String country_iso;
  final String parish;
  final String status_site;
  const SiteContainer(
      {super.key,
      required this.id,
      required this.name,
      required this.national_site_code,
      required this.country_iso,
      required this.parish,
      required this.onPress,
      required this.status_site});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(children: [
          Row(children: [
            Text(
              "Id: " + id.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "Name: " + name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: 6),
            Text(
              country_iso,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              parish,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            IconButton(
              onPressed: () => onPress(),
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
