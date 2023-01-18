import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialplus/main.dart';
import 'package:socialplus/utils/SocialColors.dart';
import 'package:socialplus/utils/SocialConstant.dart';
import 'package:socialplus/utils/SocialImages.dart';
import 'package:socialplus/utils/SocialStrings.dart';
import 'package:socialplus/utils/SocialWidget.dart';

import 'SocialSignIn.dart';

class SocialWalkThrough extends StatefulWidget {
  @override
  SocialWalkThroughState createState() => SocialWalkThroughState();
}

class SocialWalkThroughState extends State<SocialWalkThrough> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : social_app_background_color,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text(social_lbl_welcome_to_inmood, fontFamily: fontBold, fontSize: textSizeLarge),
                SizedBox(height: spacing_xxLarge),
                Lottie.asset('images/social.json',  height: width * 0.5,width: double.infinity),
               /* CachedNetworkImage(
                  placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                  imageUrl: social_walk,
                  height: width * 0.5,
                ),*/
                SizedBox(height: spacing_xxLarge),
                Container(
                  margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                  child: Text(social_welcome_info, style: secondaryTextStyle(), textAlign: TextAlign.center),
                ),
                SizedBox(height: spacing_xxLarge),
                Container(
                  margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                  child: SocialAppButton(
                    onPressed: () {
                      SocialSignIn().launch(context);
                    },
                    textContent: social_lbl_agree_continue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
