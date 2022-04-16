import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mystarter/constants/colors_data.dart';
import 'package:mystarter/constants/images.dart';
import 'package:mystarter/constants/size_config.dart';

import '../../../models/response/rp_server_model.dart';
import 'widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Get.isDarkMode
                    ? Theme.of(context).cardColor
                    : kPrimaryColor,
                //color: kPrimaryColor,
                height: 100,
                width: SizeConfig.screenWidth,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: IconButton(
                          onPressed: () {},
                          icon: SizedBox(
                            width: 20,
                            child: SvgPicture.asset(
                              Images.review,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 35,
                          child: Image.asset(
                            Images.homeLogo,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: SizeConfig.screenWidth,
              height: 200,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0)),
                  shape: BoxShape.rectangle),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.builder(
                      itemCount: serverList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ServiceCard(
                          tap: (){},
                          service: serverList[index],
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
