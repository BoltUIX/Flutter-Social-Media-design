import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialplus/main.dart';
import 'package:socialplus/screen/SocialHomeCalls.dart';
import 'package:socialplus/screen/SocialStatus.dart';
import 'package:socialplus/utils/SocialColors.dart';
import 'package:socialplus/utils/SocialConstant.dart';
import 'package:socialplus/utils/SocialImages.dart';
import 'package:socialplus/utils/SocialStrings.dart';
import 'package:socialplus/utils/SocialWidget.dart';

import 'SocialHomeChats.dart';
import 'SocialSettings.dart';

class SocialDashboard extends StatefulWidget {
  static String tag = '/SocialDashboard';

  @override
  SocialDashboardState createState() => SocialDashboardState();
}

class SocialDashboardState extends State<SocialDashboard> {
  int selectedPos = 1;

  @override
  void initState() {
    super.initState();
    LiveStream().on(social_lblDarkMode, (v) {
      setState(() {});
    });

    selectedPos = 1;
  }

  @override
  void dispose() {
    super.dispose();
    LiveStream().dispose(social_lblDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          floatingActionButton: selectedPos == 2
              ? Container(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(social_fab_edit, width: width * 0.2, height: width * 0.2),
                      Image.asset(social_fab_msg, width: width * 0.2, height: width * 0.2),
                    ],
                  ),
                )
              : Container(
                  width: width * 0.2,
                  height: width * 0.2,
                  alignment: Alignment.bottomRight,
                  child: Image.asset(social_fab_msg),
                ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                mToolbar(context, social_lbl_dashboard, social_ic_setting, onTap: () {
                  SocialSetting().launch(context);
                }),
                SizedBox(height: spacing_standard_new),
                Container(
                  width: width,
                  decoration: boxDecoration(showShadow: true),
                  margin: EdgeInsets.only(right: spacing_standard_new, left: spacing_standard_new),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            selectedPos = 1;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: width,
                            child: text(
                              social_lbl_chats,
                              fontFamily: fontMedium,
                              isCentered: true,
                              textColor: selectedPos == 1
                                  ? appStore.isDarkModeOn
                                      ? white
                                      : social_textColorPrimary
                                  : social_textColorSecondary,
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Container(width: 1, height: width * 0.1, color: social_view_color),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            selectedPos = 2;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: width,
                            child: text(social_lbl_status,
                                isCentered: true,
                                fontFamily: fontMedium,
                                textColor: selectedPos == 2
                                    ? appStore.isDarkModeOn
                                        ? white
                                        : social_textColorPrimary
                                    : social_textColorSecondary),
                          ),
                        ),
                        flex: 1,
                      ),
                      Container(width: 1, height: width * 0.1, color: social_view_color),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPos = 3;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: width,
                            child: text(social_lbl_calls,
                                isCentered: true,
                                fontFamily: fontMedium,
                                textColor: selectedPos == 3
                                    ? appStore.isDarkModeOn
                                        ? white
                                        : social_textColorPrimary
                                    : social_textColorSecondary),
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing_standard),
                if (selectedPos == 1) SocialHomeChats(),
                if (selectedPos == 2) SocialHomeStatus(),
                if (selectedPos == 3) SocialHomeCalls()
              ],
            ),
          )),
    );
  }
}
