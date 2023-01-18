import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialplus/main.dart';
import 'package:socialplus/utils/SocialConstant.dart';
import 'package:socialplus/utils/SocialStrings.dart';

import 'SocialColors.dart';

// ignore: must_be_immutable
class SocialAppButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  SocialAppButton({required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return SocialAppButtonState();
  }
}

class SocialAppButtonState extends State<SocialAppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: social_white),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        padding: const EdgeInsets.all(0.0),
      ),
      child: Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: social_colorPrimary),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: widget.textContent, style: TextStyle(fontSize: textSizeMedium)),
                  WidgetSpan(
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Icon(Icons.arrow_forward, color: social_white, size: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget SocialOption(BuildContext context, var color, var icon, var value, var subValue, {Function? onTap}) {
  var width = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      if (onTap != null) onTap();
    },
    child: Row(
      children: <Widget>[
        Container(
          decoration: boxDecoration(showShadow: false, radius: spacing_middle, bgColor: color),
          width: width * 0.13,
          height: width * 0.13,
          padding: EdgeInsets.all(spacing_middle),
          child: SvgPicture.asset(icon, color: social_white),
        ),
        SizedBox(width: spacing_middle),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[text(value, fontFamily: fontMedium), text(subValue, textColor: social_textColorSecondary, isLongText: false)],
          ),
        )
      ],
    ),
  );
}

Widget mToolbar(BuildContext context, var title, var icon, {required Function onTap}) {
  var width = MediaQuery.of(context).size.width;
  return Container(
    width: MediaQuery.of(context).size.width,
    height: width * 0.15,
    color: appStore.isDarkModeOn ? cardDarkColor : social_white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            finish(context);
            LiveStream().emit(social_lblDarkMode);
          },
          child: Container(
            margin: EdgeInsets.only(left: spacing_standard_new),
            width: width * 0.1,
            height: width * 0.1,
            decoration: boxDecoration(showShadow: false, bgColor: social_colorPrimary, radius: 12),
            child: Icon(Icons.keyboard_arrow_left, color: social_white),
          ),
        ),
        Center(
          child: text(title, fontFamily: fontBold, fontSize: textSizeLargeMedium, textAllCaps: true),
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
              margin: EdgeInsets.only(right: spacing_standard_new),
              width: width * 0.1,
              height: width * 0.1,
              padding: EdgeInsets.all(6),
              decoration: boxDecoration(showShadow: false, bgColor: social_view_color, radius: 12),
              child: SvgPicture.asset(icon, color: social_textColorPrimary)),
        ),
      ],
    ),
  );
}

Widget mTop(BuildContext context, var title, {var tags}) {
  var width = MediaQuery.of(context).size.width;
  return Container(
    width: MediaQuery.of(context).size.width,
    height: width * 0.15,
    color: context.cardColor,
    child: Stack(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: spacing_standard_new),
                width: width * 0.1,
                height: width * 0.1,
                decoration: boxDecoration(showShadow: false, bgColor: social_colorPrimary, radius: 12),
                child: Icon(Icons.keyboard_arrow_left, color: social_white),
              ),
            )),
        Center(
          child: text(title, fontFamily: fontBold, fontSize: textSizeLargeMedium, textAllCaps: true),
        ),
      ],
    ),
  );
}

// ignore: must_be_immutable
class SocialBtn extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  SocialBtn({required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return SocialBtnState();
  }
}

class SocialBtnState extends State<SocialBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: social_white),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.all(0.0),
      ),
      child: Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: social_colorPrimary),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: text(widget.textContent, textColor: social_white),
          ),
        ),
      ),
    );
  }
}

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? appStore.scaffoldBackground,
    boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Widget commonCacheImageWidget(String? url, double height, {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}

Widget? Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/placeholder.jpg', fit: BoxFit.cover);

Widget text(
  String? text, {
  var fontSize = textSizeLargeMedium,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor ?? appStore.textSecondaryColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}
