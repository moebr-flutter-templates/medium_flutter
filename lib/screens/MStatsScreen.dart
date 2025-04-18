import 'package:flutter/material.dart';
import 'package:medium_flutter/screens/PurchaseMoreScreen.dart';
import 'package:medium_flutter/utils/MColors.dart';
import 'package:medium_flutter/utils/MWidget.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class MStatsScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mGreyColor,
        key: scaffoldKey,
        drawer: Drawer(
          child: SideDrawer(),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              finish(context);
            },
            color: white,
          ),
          backgroundColor: black,
          title: Text("Stats"),
        ),
        body: PurchaseMoreScreen(),
      ),
    );
  }
}
