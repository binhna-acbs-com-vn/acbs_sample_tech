import 'dart:ui';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nab_store/components/my_appbar.dart';
import 'package:nab_store/components/my_tabbar.dart';
import 'package:nab_store/controllers/MenuController.dart';
import 'package:nab_store/tabs/recent_tab.dart';
import 'package:nab_store/tabs/top_tab.dart';
import 'package:nab_store/tabs/trending_tab.dart';
import 'package:nab_store/theme/const.dart';

import '../../constants.dart';
import '../dialog/dynamic_link_dialog.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final MenuController _controller = Get.put(MenuController());
  late TabController tabController;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
    handlePermission();
    print(_controller.tabPage);
    tabController = TabController(
        vsync: this, length: 5, initialIndex: _controller.tabPage);
  }

  handlePermission() async {
    // await Permission.camera.request();
    // await Permission.mediaLibrary.request();
    // await Permission.microphone.request();
    // print(await Permission.camera.status);
    // print(await Permission.mediaLibrary.status);

    // print(await Permission.microphone.status);
  }

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      print(dynamicLinkData);
      setState(() {
        // _controller.onSetPageFromDynamicLink(
        //     int.parse(dynamicLinkData.link.toString().split("=").last));
        print("Open dialog dynamic links");
        Get.dialog(DynamicLinkDialog(
          dynamicLink: dynamicLinkData.link.toString(),
        ));
      });
    }).onError((error) {
      print('onLink error');
      print(error);
    });
  }

  // user tapped searched button
  void searchButtonTapped() {
    _controller.openWebview();
  }

  // tab options
  List tabOption = [
    ["Recent", RecentTab()],
    ["Trending", TrendingTab()],
    ["Top", TopTab()],
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        // bottomNavigationBar: GlassBox(
        //   child: MyBottomBar(
        //     index: _currentBottonIndex,
        //     onTap: _handleIndexChanged,
        //   ),
        // ),
        body: ListView(
          children: [
            // title + search button
            MyAppBar(
              title: 'Explore Collections',
              onSearchTap: searchButtonTapped,
            ),

            // tab bar
            SizedBox(
              height: 600,
              child: MyTabBar(
                tabOptions: tabOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text(
  //           'Welcome',
  //         ),
  //         centerTitle: true,
  //         backgroundColor: Colors.grey[700]?.withOpacity(0.4),
  //       ),
  //       body: Obx(
  //         () => Column(
  //           children: <Widget>[
  //             InkWell(
  //               onTap: () => _controller.openWebview(),
  //               child: const SizedBox(
  //                 height: 50,
  //                 child: Center(
  //                   child: Text("Open Web View"),
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               color: Colors.deepPurple[50],
  //               height: 50,
  //               width: double.infinity,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       (_controller.tabPage >= 1)
  //                           ? _controller.onBackPage()
  //                           : null;
  //                     },
  //                     child: Container(
  //                       height: 30,
  //                       width: 150,
  //                       color: Colors.black,
  //                       child: const Center(
  //                         child: Text(
  //                           "BACK",
  //                           style: TextStyle(color: Colors.amber),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       (_controller.tabPage <= 3)
  //                           ? _controller.onNextPage()
  //                           : null;
  //                     },
  //                     child: Container(
  //                       height: 30,
  //                       width: 150,
  //                       color: Colors.amber,
  //                       child: const Center(
  //                         child: Text("NEXT"),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             Expanded(
  //               child: TabBarView(
  //                 controller: TabController(
  //                   vsync: this,
  //                   length: 5,
  //                   initialIndex: _controller.tabPage,
  //                 ),
  //                 physics: const NeverScrollableScrollPhysics(),
  //                 children: [
  //                   Container(
  //                     color: Colors.blue[100],
  //                     child: const Center(
  //                       child: Text(
  //                         'Page 0',
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     color: Colors.blue[200],
  //                     child: const Center(
  //                       child: Text(
  //                         'Page 1',
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     color: Colors.blue[300],
  //                     child: const Center(
  //                       child: Text(
  //                         'Page 2',
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     color: Colors.blue[400],
  //                     child: const Center(
  //                       child: Text(
  //                         'Page 3',
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     color: Colors.blue[500],
  //                     child: const Center(
  //                       child: Text(
  //                         'Page 4',
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
