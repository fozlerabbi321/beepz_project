import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../constants/colors_data.dart';
import '../../../../constants/style_data.dart';
import 'icon_indicator.dart';

TimelineTile buildTimelineTile(
    {IconIndicator? indicator,
      String? title,
      String? desc,
      required String image,
      bool isLast = false,
      bool isFast = false,
      bool complete = false,
      required BuildContext context}) {
  return TimelineTile(
    alignment: TimelineAlign.start,
    lineXY: 0.35,
    beforeLineStyle: LineStyle(
        color: complete ? kBlackColor2 : kOrdinaryColor2, thickness: 5.0),
    indicatorStyle: IndicatorStyle(
      indicatorXY: 0.3,
      drawGap: false,
      width: 20,
      height: 20,
      indicator: indicator,
    ),
    isLast: isLast,
    isFirst: isFast,
    endChild: Container(
      padding: const EdgeInsets.only(left: 16, right: 10, top: 0, bottom: 10),
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: SvgPicture.asset(
              image,
              color: complete
                  ? kPrimaryColor
                  : Get.isDarkMode
                  ? kWhiteColor
                  : kBlackColor2,
              height: 25,
            ),
          ),
          kWidthBox10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title ?? "",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: complete
                        ? kPrimaryColor
                        : Get.isDarkMode
                        ? kWhiteColor
                        : kBlackColor2,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
                Text(
                  desc ?? "",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Get.isDarkMode
                        ? kStUnderLineColor
                        : kStUnderLineColor2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}