import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spc_smartmeter/app/modules/auth/controllers/auth_controller.dart';

import '../../../common_widgets/spc_elevatedbutton.dart';
import '../../../common_widgets/spc_profile_menu.dart';
import '../../../constants/text_strings.dart';
import '../../user/models/user_model.dart';
import '../controllers/profile_controller.dart';

class ProfileDrawer extends GetView<ProfileController> {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => authController.firebaseUser.value?.photoURL !=
                                  null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(authController
                                      .firebaseUser.value!.photoURL!),
                                )
                              : CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  child: FutureBuilder<UserModel?>(
                                    future: controller.getUserData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<UserModel?> snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data!.name[0],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                        );
                                      } else {
                                        return Text(
                                          SPCTextString.loadingPlaceholder,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                        );
                                      }
                                    },
                                  )),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<UserModel?>(
                                future: controller.getUserData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<UserModel?> snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data!.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    );
                                  } else {
                                    return Text(
                                      SPCTextString.loadingPlaceholder,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SPCElevatedButton(
                      onPressed: () {
                        // Get.to(() => const EditProfileScreen());
                      },
                      text: SPCTextString.editProfileTitle,
                    ),
                  ],
                ),
              ),
              // Divider(
              //   color: Theme.of(context).colorScheme.primary,
              //   indent: 20,
              //   endIndent: 20,
              // ),
              // SPCProfileMenu(
              //     onTap: () {
              //       SPCUtils.comingSoonSnackbar();
              //     },
              //     leadingIcon: Icons.person,
              //     text: SPCTextString.accountsTitle),
              // Divider(
              //   color: Theme.of(context).colorScheme.primary,
              //   indent: 20,
              //   endIndent: 20,
              // ),
              // SPCProfileMenu(
              //     onTap: () {
              //       SPCUtils.comingSoonSnackbar();
              //     },
              //     leadingIcon: Icons.settings,
              //     text: SPCTextString.settingsTitle),
              // Divider(
              //   color: Theme.of(context).colorScheme.primary,
              //   indent: 20,
              //   endIndent: 20,
              // ),
              // SPCProfileMenu(
              //   onTap: () {
              //     SPCUtils.comingSoonSnackbar();
              //   },
              //   leadingIcon: Icons.info,
              //   text: SPCTextString.aboutTitle,
              // ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                indent: 20,
                endIndent: 20,
              ),
              SPCProfileMenu(
                  onTap: () {
                    Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  },
                  leadingIcon: Icons.dark_mode,
                  trailingIcon: Get.isDarkMode
                      ? Icons.toggle_on_outlined
                      : Icons.toggle_off_outlined,
                  text: SPCTextString.darkMode),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                indent: 20,
                endIndent: 20,
              ),
              SPCProfileMenu(
                  isError: true,
                  onTap: () {
                    authController.signOutUser();
                  },
                  leadingIcon: Icons.logout,
                  text: SPCTextString.logOut),
            ],
          ),
        ),
      ),
    );
  }
}
