import 'package:flutter/material.dart';
import 'package:medium_flutter/utils/AppWidget.dart';
import 'package:medium_flutter/utils/MColors.dart';
import 'package:medium_flutter/utils/MImages.dart';
import 'package:nb_utils/nb_utils.dart';

class MEditProfileScreen extends StatefulWidget {
  static String tag = '/MEditProfileScreen';
  final String? name;

  MEditProfileScreen({this.name});

  @override
  MEditProfileScreenState createState() => MEditProfileScreenState();
}

class MEditProfileScreenState extends State<MEditProfileScreen> {
  var nameCont = TextEditingController();
  var aboutCont = TextEditingController();

  var aboutFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    nameCont.text = widget.name!;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Edit Profile', color: Colors.black, actions: [
        Text('SAVE', style: primaryTextStyle(size: 18, color: white)).center().paddingRight(8).onTap(() {
          finish(context);
        })
      ]),
      body: SingleChildScrollView(
        child: Container(
          width: context.width(),
          height: context.height(),
          color: mGreyColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Edit your profile', style: primaryTextStyle(color: white, size: 20)),
              16.height,
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    child: commonCacheImageWidget(MPostImg1, height: 60, width: 60, fit: BoxFit.cover),
                  ),
                  24.width,
                  Text('Choose an image', style: primaryTextStyle(size: 18, color: mLimeColor)),
                ],
              ),
              16.height,
              Text('Name', style: secondaryTextStyle(color: white)),
              TextFormField(
                controller: nameCont,
                cursorColor: white,
                style: primaryTextStyle(color: white),
                decoration: InputDecoration(
                  hintText: 'Enter your display name',
                  hintStyle: secondaryTextStyle(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: viewLineColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mLimeColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: viewLineColor),
                  ),
                ),
                onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(aboutFocusNode),
                textInputAction: TextInputAction.next,
              ),
              16.height,
              Text('About', style: secondaryTextStyle(color: white)),
              TextFormField(
                controller: aboutCont,
                focusNode: aboutFocusNode,
                cursorColor: white,
                style: primaryTextStyle(color: white),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter a short bio',
                  hintStyle: secondaryTextStyle(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: viewLineColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mLimeColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: viewLineColor),
                  ),
                ),
              )
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
