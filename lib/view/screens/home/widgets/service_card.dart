import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystarter/constants/colors_data.dart';
import 'package:mystarter/constants/size_config.dart';
import 'package:mystarter/constants/style_data.dart';
import 'package:mystarter/models/response/rp_server_model.dart';

import '../../../../constants/images.dart';

class ServiceCard extends StatelessWidget {
  final RpServerModel service;
  final Function tap;

  const ServiceCard({
    Key? key,
    required this.service,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Theme.of(context).cardColor,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Expanded(
                  child: Padding(
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
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! / 3.3,
                  child: Text(
                    service.statusType ?? '',
                    style:
                    Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: const Color(0xFF00B659),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        kHeightBox15,
      ],
    );
  }
}
