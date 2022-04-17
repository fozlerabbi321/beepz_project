import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors_data.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
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
          child: SingleChildScrollView(
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
                                Images.back,
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
                Container(
                  padding: const EdgeInsets.only(top: 58),
                  child: Container(
                    padding: const EdgeInsets.only(top: 0,),
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0)),
                        shape: BoxShape.rectangle),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: SizeConfig.screenWidth,
                            child:  ServiceTimeline(service: service, status: service.status ?? 0,),),
                        ],
                      ),
                    ),
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
