import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
              color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).colorScheme.onPrimary,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                );
                              } else {
                                return Text(
                                  SPCUtils.greetingWithName(
                                      SPCTextString.loadingPlaceholder),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
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
                            color: Theme.of(context).colorScheme.onPrimary,
                          )),
                      IconButton(
                        onPressed: () {
                          Get.to(() => SPCBlankScreen(
                                appbarTitle: 'Notifications'.hardcoded,
                                bodyText: 'You have no notifications'.hardcoded,
                              ));
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Theme.of(context).colorScheme.onPrimary,
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
    );
  }
}
