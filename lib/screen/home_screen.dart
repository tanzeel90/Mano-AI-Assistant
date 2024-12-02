import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
//import 'package:mano_ai/controller/chat_controller.dart';
//import 'package:mano_ai/apis/apis.dart';
import 'package:mano_ai/helper/global.dart';
import 'package:mano_ai/helper/pref.dart';
import 'package:mano_ai/main.dart';
import 'package:mano_ai/model/home_type.dart';
import 'package:mano_ai/widgets/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarkMode = Pref.isDarkMode.obs;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size here
    mq = MediaQuery.sizeOf(context);

//sample api call
    //APIs.getAnswer('hii');

    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarColor,
        title: const Text(appName),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {
                Get.changeThemeMode(
                    _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

                _isDarkMode.value = !_isDarkMode.value;
                Pref.isDarkMode = _isDarkMode.value;
              },
              icon: Obx(() => Icon(
                    _isDarkMode.value
                        ? Icons.brightness_2_rounded
                        : Icons.brightness_5_rounded,
                    size: 26,
                  )))
        ],
      ),
      //body
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 15),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}
