import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spc_smartmeter/app/common_widgets/spc_home_menu.dart';
import 'package:spc_smartmeter/app/localization/hardcoded.dart';

import '../../../common_widgets/spc_blank_screen.dart';
import '../../../constants/text_strings.dart';
import '../../../utils/spc_utils.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/views/profile_drawer.dart';
import '../../user/models/user_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: const ProfileDrawer(),
        appBar: PreferredSize(
          preferredSize: Size(Get.width, AppBar().preferredSize.height),
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: FutureBuilder<UserModel?>(
                              future: profileController.getUserData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<UserModel?> snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    SPCUtils.greetingWithName(
                                        snapshot.data!.name),
                                    style:
                                        Get.theme.textTheme.bodyLarge?.copyWith(
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                } else {
                                  return Text(
                                    SPCUtils.greetingWithName(
                                        SPCTextString.loadingPlaceholder),
                                    style:
                                        Get.theme.textTheme.bodyLarge?.copyWith(
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(() => SPCBlankScreen(
                                    appbarTitle: 'Inbox Mail'.hardcoded,
                                    bodyText: 'You have no mail in your inbox'
                                        .hardcoded,
                                  ));
                            },
                            icon: Icon(
                              Icons.mail,
                              color: Get.theme.colorScheme.onPrimary,
                            )),
                        IconButton(
                          onPressed: () {
                            Get.to(() => SPCBlankScreen(
                                  appbarTitle: 'Notifications'.hardcoded,
                                  bodyText:
                                      'You have no notifications'.hardcoded,
                                ));
                          },
                          icon: Icon(
                            Icons.notifications,
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SPCHomeMenu(
                      Icon(
                        Icons.grain_outlined,
                        size: 64,
                        color: Get.theme.colorScheme.primary,
                      ),
                      'Grain Quality'.hardcoded,
                      'Read and analyze grain quality and quantity using smartphone camera. You can monitor grain quality day to day using historical trending. Alarm can notify user concerning bad quality grain.'
                          .hardcoded,
                    ),
                    SPCHomeMenu(
                      Icon(
                        Icons.bolt_outlined,
                        size: 64,
                        color: Get.theme.colorScheme.primary,
                      ),
                      'Electricity'.hardcoded,
                      'Read electricity total KWH consumption value from KWH meter using smartphone camera. You can monitor electricity consumption day to day using historical trending. Alarm can notify user concerning electricity consumption.'
                          .hardcoded,
                    ),
                    SPCHomeMenu(
                      Icon(
                        Icons.directions_car_outlined,
                        size: 64,
                        color: Get.theme.colorScheme.primary,
                      ),
                      'Automobile'.hardcoded,
                      'Read automobile total KM value and fuel consumption from odometer dashboard using smartphone camera. You can monitor automobile KM and fuel consumption day to day using historical trending. Alarm can notify user concerning automobile KM and fuel consumption.'
                          .hardcoded,
                    ),
                    SPCHomeMenu(
                      Icon(
                        Icons.two_wheeler_outlined,
                        size: 64,
                        color: Get.theme.colorScheme.primary,
                      ),
                      'Motorcycle'.hardcoded,
                      'Read motorcycle total KM value and fuel consumption from odometer dashboard using smartphone camera. You can monitor motorcycle KM and fuel consumption day to day using historical trending. Alarm can notify user concerning motorcycle KM and fuel consumption.'
                          .hardcoded,
                    ),
                    SPCHomeMenu(
                      Icon(
                        Icons.gas_meter_outlined,
                        size: 64,
                        color: Get.theme.colorScheme.primary,
                      ),
                      'Gas'.hardcoded,
                      'Read gas consumption value from gas flow meter using smartphone camera. You can monitor gas consumption day to day using historical trending. Alarm can notify user concerning gas consumption.'
                          .hardcoded,
                    ),
                    SPCHomeMenu(
                      Icon(
                        Icons.water_drop_outlined,
                        size: 64,
                        color: Get.theme.colorScheme.primary,
                      ),
                      'Water'.hardcoded,
                      'Read water consumption value from water flow meter using smartphone camera. You can monitor water consumption day to day using historical trending. Alarm can notify user concerning water consumption.'
                          .hardcoded,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
