import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/webview/ekyc_webview.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  RxInt _tabPage = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  int get tabPage => _tabPage.value;
  List<String> get menuItems =>
      ["Cases", "Services", "About Us", "Careers", "Blog", "Contact"];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }

  void openWebview() {
    print("open web view");
    Get.to(WebviewEKYC());
  }

  void onSetPageFromDynamicLink(int pageNumber) {
    _tabPage.value = pageNumber;
  }

  void onNextPage() {
    _tabPage.value = _tabPage.value + 1;
  }

  void onBackPage() {
    _tabPage.value = _tabPage.value - 1;
  }
}
