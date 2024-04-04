import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class CustomDrawerController extends GetxController {
  static CustomDrawerController get instance => Get.find();
  late var uData;
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];
  int currentTarget = 0;

  GlobalKey drawer = GlobalKey();
  GlobalKey brands = GlobalKey();
  // GlobalKey products = GlobalKey();
  GlobalKey notification = GlobalKey();
  // RxDouble xOffset = 0.0.obs;
  // RxDouble yOffset = 0.0.obs;
  bool isDrawerOpen = false;

  @override
  void onInit() {
    // final appStorage = Get.find<AppStorage>();
    // uData = appStorage.getUserData();
    // print(uData);
    Future.delayed(const Duration(seconds: 1), () {
      createTutorial();
      Future.delayed(Duration.zero, showTutorial);
    });
    super.onInit();
  }

  void openDrawer() {
    // xOffset.value = 45.0.getWidth();
    // yOffset.value = 55.0.getHeight();
    isDrawerOpen = true;
    // log(xOffset.toString());
    // log(yOffset.toString());
    // print('open drawer :vishal');

    update(['drawer']);
  }

  void closeDrawer() {
    // xOffset.value = 0.0;
    // yOffset.value = 0.0;
    isDrawerOpen = false;
    // print('close drawer : vishal');

    update(['drawer']);
    // log(xOffset.toString());
    // log(yOffset.toString());
  }

  void navigateTo(route) async {
    // xOffset.value = 0.0;
    // yOffset.value = 0.0;
    isDrawerOpen = false;
    closeDrawer();
    // update(['drawer']);
    Get.toNamed(route);
    update(['drawer']);
  }

  void showTutorial() {
    tutorialCoachMark.show(context: Get.context!);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.red,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "drawer",
        keyTarget: drawer,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "notificarion",
        keyTarget: notification,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "brands",
        keyTarget: brands,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      tutorialCoachMark.goTo(0);
                    },
                    child: const Text('Go to index 0'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    return targets;
  }
}
