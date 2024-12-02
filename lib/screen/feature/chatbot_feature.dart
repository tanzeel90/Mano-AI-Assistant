import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mano_ai/controller/chat_controller.dart';
import 'package:mano_ai/helper/global.dart';
import 'package:mano_ai/main.dart';
import 'package:mano_ai/widgets/message_card.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarColor,
        title: const Text('Chat with AI Assistant'),
      ),

      //send message field & btn
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            //text input field
            Expanded(
                child: TextFormField(
              controller: _c.textC,
              textAlign: TextAlign.center,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me any thing you want',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            )),

            // for adding some space
            const SizedBox(
              width: 8,
            ),

            //send button
            CircleAvatar(
              radius: 24,
              //backgroundColor: Theme.of(context).buttonRocColor,
              child: IconButton(
                  onPressed: _c.askQuestion,
                  icon: Icon(
                    Icons.rocket_launch_rounded,
                    color: Theme.of(context).buttonRocColor,
                  )),
            ),
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
