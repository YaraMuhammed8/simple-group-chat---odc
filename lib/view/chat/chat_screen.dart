import 'package:chatodc/core/components/default_text_form_field.dart';
import 'package:chatodc/core/styles/colors/app_colors.dart';
import 'package:chatodc/core/styles/texts/app_text_styles.dart';
import 'package:chatodc/cubit/main/main_cubit.dart';
import 'package:chatodc/services/local/shared_preference/cache_helper.dart';
import 'package:chatodc/view/chat/message_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/message.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  bool messageIsNotEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Group chat",
          style: AppTextStyle.appBarText().copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('chat')
                        .snapshots(),
                    builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) =>
                        (!snapshot.hasData)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView(
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.all(10),
                                children: snapshot.data!.docs.map((document) {
                                  return MessageItem(
                                    message: Message(
                                      name: document['name'],
                                      text: document['text'],
                                      time: document['time'],
                                    ),
                                    fromMe: (document['name'] ?? "user") ==
                                        CacheHelper.getData(key: "name"),
                                  );
                                }).toList(),
                              )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: DefaultTextFormField(
                      textInputType: TextInputType.text,
                      controller: messageController,
                      isFilled: true,
                      hasBorder: false,
                      hintText: "Type message",
                      suffixIcon: Icons.mic_rounded,
                      onPressSuffixIcon: () {},
                      onChange: (value) {
                        setState(() {
                          if (messageController.text.isEmpty) {
                            messageIsNotEmpty = false;
                          } else {
                            messageIsNotEmpty = true;
                          }
                        });
                      },
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    if (messageIsNotEmpty)
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              Message message = Message(
                                  name: CacheHelper.getData(key: "name"),
                                  time: Timestamp.now(),
                                  text: messageController.text);
                              cubit.sendMessage(message.toCollection());
                              messageController.text = "";
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                            )),
                      ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
