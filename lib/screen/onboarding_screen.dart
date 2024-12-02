import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:mano_ai/helper/global.dart';
import 'package:mano_ai/main.dart';
import 'package:mano_ai/model/onboard.dart';
import 'package:mano_ai/screen/home_screen.dart';
import 'package:mano_ai/widgets/custom_btn.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      //onboarding 1
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your best friend. You can ask me anything & I will help you!',
          lottie: 'ai_ask'),

      //onboarding 2
      Onboard(
          title: 'Imagination to Reality',
          subtitle:
              'Just imagine anything & let me know, I will create a wonderful for you!',
          lottie: 'ai_play'),
    ];

    return Scaffold(
        body: PageView.builder(
      controller: c,
      itemCount: list.length,
      itemBuilder: (ctx, ind) {
        final islast = ind == list.length - 1;

        return Column(
          children: [
            //lottie
            Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                height: mq.height * .6),

            //title
            Text(
              list[ind].title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: .5),
            ),

            SizedBox(
              height: mq.height * .015,
            ),

            //subtitle
            SizedBox(
              width: mq.width * .7,
              child: Text(
                list[ind].subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13.5,
                    letterSpacing: .5,
                    color: Theme.of(context).lightTextColor),
              ),
            ),

            const Spacer(),

            //dots
            Wrap(
              spacing: 10,
              children: List.generate(
                  list.length,
                  (i) => Container(
                        width: i == ind ? 15 : 10,
                        height: 8,
                        decoration: BoxDecoration(
                            color: i == ind ? Colors.blue : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                      )),
            ),

            const Spacer(),

            //button
            CustomBtn(
                onTap: () {
                  if (islast) {
                    Get.off(() => const HomeScreen());
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (_) => const HomeScreen()));
                  } else {
                    c.nextPage(
                        duration: const Duration(microseconds: 600),
                        curve: Curves.ease);
                  }
                },
                text: islast ? "Finish" : "Next"),

            const Spacer(
              flex: 2,
            )
          ],
        );
      },
    ));
  }
}
