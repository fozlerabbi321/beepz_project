import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mystarter/constants/colors_data.dart';
import 'package:mystarter/constants/images.dart';
import 'package:mystarter/constants/size_config.dart';
import 'package:mystarter/view/screens/tracking/service_traking_screen.dart';

import '../../../models/response/rp_server_model.dart';
import '../../widgets/side_menu.dart';
import 'widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280,),
        child: const SideMenu(
        ),
      ),
      drawerEnableOpenDragGesture : false,
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
                          Scaffold.of(cnx).openDrawer();

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
                  margin: const EdgeInsets.only(top: 10),
                  width: SizeConfig.screenWidth,
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
                              tap: (){
                                Get.to(() => ServiceTrackingScreen(service: serverList[index], ));
                              },
                              service: serverList[index],
                            );
                          }),
                    ),
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
