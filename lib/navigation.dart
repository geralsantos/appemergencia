import 'package:appemergencia/app_theme.dart';
import 'package:appemergencia/components/CustomeDrawer/drawer_user_controller.dart';
import 'package:appemergencia/components/CustomeDrawer/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:appemergencia/app/Services/GpsLocation.dart';

import 'inicio/home.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  int drawerIndex;
  String geoLocation = "", geoLocation2 = "";

  @override
  void initState() {
    drawerIndex = 0;
    screenView =  Inicio();
    _getLocation();
    super.initState();
  }

  Future _getLocation() async {
    geoLocation = await getLocation();
    setState(() {
      geoLocation2 = geoLocation;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (int drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(int drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case 0:
          setState(() {
            screenView = Inicio();
          });
          break;
        case 1:
          setState(() {
          });
          break;
        case 2:
          setState(() {
            //screenView = const HorarioClases();
          });
          break;
        case 3:
          setState(() {
            //screenView = const HorarioClases();
          });
          break;
        case 4:
          setState(() {
           // screenView = const HorarioClases();
          });
          break;
        default:
      }
      
    }
  }
}
