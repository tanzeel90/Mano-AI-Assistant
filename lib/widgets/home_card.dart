import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:mano_ai/helper/global.dart';
import 'package:mano_ai/model/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
        color: Colors.blue.withOpacity(.2),
        elevation: 0,
        margin: EdgeInsets.only(bottom: mq.height * .02),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: homeType.OnTap,
          child: homeType.leftAlign
              ? Row(
                  children: [
                    Container(
                      width: mq.width * .35,
                      //height: mq.height * 0,
                      padding: homeType.padding,
                      child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                    ),
                    const Spacer(),
                    Text(
                      homeType.title,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Langer'),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Spacer(),
                    Text(
                      homeType.title,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Langer'),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Container(
                      width: mq.width * .35,
                      padding: homeType.padding,
                      child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                    ),
                  ],
                ),
        )).animate().fade(duration: 2.seconds, curve: Curves.easeIn);
  }
}
