import 'package:covid_19_live_tracker/screens/mycard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../screens/navigation_option.dart';
import '../screens/global.dart';
import '../screens/country.dart';
import 'country.dart';
import 'global.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
  MYCARD,
}

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Column(
            children: [Icon(Icons.language, size: 30), Text("Global")],
          ),
          Column(
            children: [Icon(Icons.location_city, size: 30), Text("Country")],
          ),
          Column(
            children: [Icon(Icons.person, size: 30), Text("Devoloper")],
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              navigationStatus = NavigationStatus.GLOBAL;
            } else if (index == 1) {
              navigationStatus = NavigationStatus.COUNTRY;
            } else
              navigationStatus = NavigationStatus.MYCARD;
          });

          //Handle button tap
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: detectStatus(navigationStatus),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget detectStatus(NavigationStatus navigationStatus) {
  if (navigationStatus == NavigationStatus.COUNTRY)
    return Country();
  else if (navigationStatus == NavigationStatus.GLOBAL)
    return Global();
  else
    return MyCard();
}
