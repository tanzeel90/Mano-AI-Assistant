import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mano_ai/helper/global.dart';
import 'package:mano_ai/helper/pref.dart';
import 'package:mano_ai/screen/home_screen.dart';
import 'package:mano_ai/screen/onboarding_screen.dart';
import 'package:mano_ai/widgets/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //wait for a while and go to next screen
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (_) => Pref.showOnboarding
      //         ? const OnboardingScreen()
      //         : const HomeScreen()));
      Get.off(() =>
          Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size here
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            //adding spacer
            const Spacer(
              flex: 2,
            ),

            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .04),
                child:
                    Image.asset('assets/images/logo.png', width: mq.width * .3),
              ), //padding
            ), //card

            //spacer
            const Spacer(),

            //lottie loading
            const CustomLoading(),

            //spacer
            const Spacer()
          ],
        ),
      ),
    );
  }
}
