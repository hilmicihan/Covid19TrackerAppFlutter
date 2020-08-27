import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../utils/constants.dart';

import '../utils/constants.dart';
import '../utils/constants.dart';
import '../widgets/counter.dart';

import '../models/global_summary.dart';
import 'package:covid_19_live_tracker/constant.dart';

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;

  GlobalStatistics({@required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: AssetImage("assets/images/stayhome.jpg"),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: kkShadowColor,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Counter(
                color: kConfirmedColor,
                number: summary.totalConfirmed
                    .toString()
                    .replaceAllMapped(reg, mathFunc),
                title: "Total Confirmed",
              ),
              Counter(
                color: kConfirmedColor,
                number: summary.newConfirmed
                    .toString()
                    .replaceAllMapped(reg, mathFunc),
                title: "New Confirmed",
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: kkShadowColor,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Counter(
                color: kActiveColor,
                number: (summary.totalConfirmed -
                        summary.totalRecovered -
                        summary.totalDeaths)
                    .toString()
                    .replaceAllMapped(reg, mathFunc),
                title: "Total Active",
              ),
              Counter(
                color: kActiveColor,
                number: (summary.newConfirmed -
                        summary.newRecovered -
                        summary.newDeaths)
                    .toString()
                    .replaceAllMapped(reg, mathFunc),
                title: "New Active",
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: kkShadowColor,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Counter(
                color: kkRecovercolor,
                number: summary.totalRecovered
                    .toString()
                    .replaceAllMapped(reg, mathFunc),
                title: "Total recovered",
              ),
              Counter(
                color: kkRecovercolor,
                number: summary.newRecovered
                    .toString()
                    .replaceAllMapped(reg, mathFunc),
                title: "New recovered",
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: kkShadowColor,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Counter(
                color: kDeathColor,
                number: summary.totalDeaths
                    .toString()
                    .replaceAllMapped(reg, mathFunc),
                title: "Total deaths",
              ),
              Counter(
                color: kDeathColor,
                number: summary.newDeaths
                    .toString()
                    .replaceAllMapped(reg, mathFunc),
                title: "New deaths",
              ),
            ],
          ),
        ),

        /* 
        buildCard("RECOVERED", summary.totalRecovered, summary.newRecovered,
            kRecoveredColor),
        buildCard("DEATH", summary.totalDeaths, summary.newDeaths, kDeathColor), */
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            "Statistics updated " + timeago.format(summary.date),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      totalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Today",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      todayCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
