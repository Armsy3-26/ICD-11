import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CurrentScreen extends GetxController {
  Widget? currentWidget;

  getWidget(Widget onWidget) {
    currentWidget = onWidget;
    update();
  }
}
