import 'package:covid/screen/contactscreen.dart';
import 'package:covid/screen/worlddashboard.dart';
import 'package:covid/widget/cardboard.dart';
import 'package:covid/widget/deathcase.dart';
import 'package:covid/widget/totalcaseplot.dart';

import 'package:covid/widget/hospitalizedcase.dart';
import 'package:covid/widget/recoveredcase.dart';
import 'package:covid/widget/totalcase.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Container(
            child: TabBar(
              indicatorColor: Color(0xff022b59),
              labelColor: Color(0xff022b59),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Thailand",
                  icon: Icon(Icons.flag),
                ),
                Tab(
                  text: "World",
                  icon: Icon(Icons.medical_services),
                ),
                Tab(
                  text: "Contact us",
                  icon: Icon(Icons.contact_mail),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomPadding: false,
                  backgroundColor: Colors.red[500],
                  body: Center(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                          child: Text(
                            'COVID-19 Tracker',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0,
                                color: Colors.white),
                          ),
                        ),
                        Todaydashboard(),
                        Expanded(child: Totalcaseplot()),
                      ],
                    ),
                  ),
                ),
              ),
              WorldDashboard(),
              ContactScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class Todaydashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Cardboard(
        MediaQuery.of(context).size.width * 0.9,
        MediaQuery.of(context).size.height * 0.4,
        Colors.grey,
        Column(
          children: [
            TotalCase(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [RecoverCase(), HospitalizedCase(), DeathCase()],
            )
          ],
        ),
        EdgeInsets.only(top: 10));
  }
}
