import 'package:flutter/material.dart';
import 'package:medium_flutter/modal/MModel.dart';
import 'package:medium_flutter/utils/AppWidget.dart';
import 'package:medium_flutter/utils/MColors.dart';
import 'package:medium_flutter/utils/MDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class MTopicComponents extends StatefulWidget {
  static String tag = '/MTopicComponents';

  @override
  MTopicComponentsState createState() => MTopicComponentsState();
}

class MTopicComponentsState extends State<MTopicComponents> {
  List<MTopicModel> topicList = getTopicList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: topicList.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        MTopicModel data = topicList[index];
        return Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonCacheImageWidget(data.img.validate(), height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
              16.width,
              Text(data.title.validate(), style: primaryTextStyle(color: white)).expand(),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                decoration: boxDecoration(color: data.isFollow ? Colors.transparent : mLimeColor, bgColor: data.isFollow ? mLimeColor : Colors.transparent, radius: 5),
                child: Text(data.isFollow ? 'Following' : 'Follow', style: primaryTextStyle(color: white)),
              ).onTap(() {
                data.isFollow = !data.isFollow;
                setState(() {});
              })
            ],
          ),
        );
      },
    );
  }
}
