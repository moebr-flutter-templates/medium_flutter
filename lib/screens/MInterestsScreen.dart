import 'package:flutter/material.dart';
import 'package:medium_flutter/Componant/MTopicComponents.dart';
import 'package:medium_flutter/modal/MModel.dart';
import 'package:medium_flutter/screens/PurchaseMoreScreen.dart';
import 'package:medium_flutter/utils/MColors.dart';
import 'package:medium_flutter/utils/MDataProvider.dart';
import 'package:medium_flutter/utils/MWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MInterestsScreen extends StatefulWidget {
  static String tag = '/MInterestsScreen';

  @override
  MInterestsScreenState createState() => MInterestsScreenState();
}

class MInterestsScreenState extends State<MInterestsScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController? tabController;
  List<Widget> tabs = [];
  List<String> tabList = ['Topics', 'People', 'Publications'];
  List<MListModel> savingList = getSavingPostList();
  List<MListModel> archivedList = getArchivedList();
  List<MListModel> recentList = getRecentViewList();
  List<MListModel> highlightedList = getHighlightPostList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    tabList.forEach((element) {
      tabs.add(
        Container(
          padding: EdgeInsets.all(16.0),
          child: Text(element),
        ),
      );
    });
  }

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: white),
              onPressed: () {
                finish(context);
              },
            ),
            title: Text('Interests', style: primaryTextStyle(color: white)),
            centerTitle: false,
            bottom: TabBar(
              isScrollable: true,
              tabs: tabList.map((String key) => Tab(text: key)).toList(),
            ),
          ),
          body: TabBarView(
            children: [
              Container(color: mGreyColor, child: MTopicComponents()),
              Container(color: mGreyColor, child: PurchaseMoreScreen()),
              Container(color: mGreyColor, child: PurchaseMoreScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
