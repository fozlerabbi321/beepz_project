import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors_data.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../../constants/style_data.dart';
import '../../../models/response/rp_server_model.dart';
import 'widgets/service_time_line.dart';


class ServiceTrackingScreen extends StatelessWidget{
  final RpServerModel service;

  const ServiceTrackingScreen({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Get.isDarkMode
              ? Theme.of(context).cardColor
              : kPrimaryColor,
          child: Column(
            children: [
              Container(
                color: Get.isDarkMode
                    ? Theme.of(context).cardColor
                    : kPrimaryColor,
                //color: kPrimaryColor,
                height: 58,
                width: SizeConfig.screenWidth,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Builder(
                      builder: (cnx) => // Ensure Scaffold is in context
                      InkWell(
                        onTap: () {
                          log('message');
                         Get.back();

                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,),
                            child: SvgPicture.asset(
                              Images.menu,
                              color: kWhiteColor,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 35,
                        child: Image.asset(
                          Images.homeLogo,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Card(
                            color: Theme.of(context).errorColor,
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
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 60,),
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                topLeft: Radius.circular(15.0)),
                            shape: BoxShape.rectangle),
                        child: Stack(
                          children: [

                            SingleChildScrollView(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    kHeightBox25,
                                    kHeightBox25,
                                    kHeightBox25,
                                    SizedBox(
                                      width: SizeConfig.screenWidth,
                                      child: const ServiceTimeline(),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
