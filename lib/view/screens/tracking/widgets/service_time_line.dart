import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mystarter/constants/style_data.dart';
import 'package:mystarter/models/response/rp_server_model.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../constants/colors_data.dart';
import '../../../../constants/images.dart';
import '../../../../constants/size_config.dart';
import '../../../../models/response/rp_time_line_model.dart';

class ServiceTimeline extends StatelessWidget {
  final RpServerModel service;
  final int status;

  const ServiceTimeline({
    Key? key,
    this.status = 0,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [ Positioned(
          top: -50,
          child:  SizedBox(
            width: SizeConfig.screenWidth,
            child: Card(
              color: Theme.of(context).cardColor,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10,),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: kPrimaryColor, shape: BoxShape.circle),
                      child: Image.asset(
                        Images.service,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.title ?? '',
                            maxLines: 1,
                            style:
                            Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: kSecondaryColor,
                            ),
                          ),
                          kHeightBox5,
                          Text(
                            'Car Details: ${service.subtitle ?? ''}',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                              color:
                              Get.isDarkMode ? kWhiteColor : kBlackColor,
                            ),
                          ),
                          kHeightBox5,
                          Text(
                            'Date of service: ${service.date ?? ''}',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                              color:
                              Get.isDarkMode ? kWhiteColor : kBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),),
        Padding(
          padding: const EdgeInsets.only(top: 35,),
          child: ListView.builder(
              itemCount: serverTimeList.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildTimelineTile(
                  indicator: _IconIndicator(
                    size: 20,
                    complete: status == 0 && index == 0 ? true : false,
                  ),
                  complete: status == 0 && index == 0 ? true : false,
                  image: serverTimeList[index].image ?? '',
                  title: serverTimeList[index].title ?? '',
                  desc: serverTimeList[index].desc ?? '',
                  isFast: serverTimeList[index].isFast ?? false,
                  isLast: serverTimeList[index].isLast ?? false,
                  context: context,
                );
              }),
        ),
      ],
    );
  }

  TimelineTile _buildTimelineTile(
      {_IconIndicator? indicator,
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
              width: 30,
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
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: complete
                              ? kPrimaryColor
                              : Get.isDarkMode
                                  ? kWhiteColor
                                  : kBlackColor2,
                        ),
                  ),
                  const SizedBox(height: 4),
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
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    Key? key,
    required this.size,
    this.complete = false,
  }) : super(key: key);

  final double size;
  final bool complete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: size,
              width: size,
              child: complete
                  ? const Icon(
                      Icons.check_circle,
                      color: kSuccessColor,
                    )
                  : const Icon(
                      Icons.circle,
                      color: kOrdinaryColor,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
