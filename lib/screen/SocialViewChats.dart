import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialplus/model/SocialModel.dart';
import 'package:socialplus/utils/SocialConstant.dart';
import 'package:socialplus/utils/SocialDataGenerator.dart';
import 'package:socialplus/utils/SocialWidget.dart';

import 'SocialHomeChats.dart';

class SocialViewChat extends StatefulWidget {
  static String tag = '/SocialViewChat';

  @override
  SocialViewChatState createState() => SocialViewChatState();
}

class SocialViewChatState extends State<SocialViewChat> {
  late List<SocialUser> mList;

  @override
  void initState() {
    super.initState();
    mList = addSeeMoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, ''),
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              decoration: boxDecoration(radius: spacing_middle),
              padding: EdgeInsets.all(spacing_middle),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Chats(mList[index], index);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
