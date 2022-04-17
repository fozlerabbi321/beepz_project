import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystarter/constants/style_data.dart';
import 'package:mystarter/models/response/rp_server_model.dart';

import '../../../../constants/colors_data.dart';
import '../../../../constants/images.dart';
import '../../../../constants/size_config.dart';
import '../../../../models/response/rp_time_line_model.dart';
import 'icon_indicator.dart';
import 'time_line_card.dart';

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
      children: [
        Positioned(
          top: -50,
          left: 15,
          right: 15,
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: Card(
              color: Theme.of(context).cardColor,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          color: kSecondaryColor, shape: BoxShape.circle),
                      child: Image.asset(
                        Images.orderRec,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Number',
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: kSecondaryColor,
                                    ),
                          ),
                          kHeightBox5,
                          Text(
                            '#${service.id ?? 0}',
                            style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Get.isDarkMode
                                  ? kWhiteColor
                                  : kBlackColor2,
                              fontWeight: FontWeight.w600,
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 35,
          ),
          child: ListView.builder(
              itemCount: serverTimeList.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return buildTimelineTile(
                  indicator: IconIndicator(
                    size: 50,
                    complete: index < status ? true : false,
                  ),
                  complete: index < status ? true : false,
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

}
