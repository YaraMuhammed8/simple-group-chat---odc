import 'package:chatodc/core/components/default_button.dart';
import 'package:chatodc/core/utils/navigation.dart';
import 'package:chatodc/services/local/shared_preference/cache_helper.dart';
import 'package:chatodc/view/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/default_text_form_field.dart';

class EnterNameScreen extends StatelessWidget {
  EnterNameScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextFormField(
                textInputType: TextInputType.text,
                controller: nameController,
                isFilled: true,
                hasBorder: false,
                hintText: "Enter your name",
              ),
              SizedBox(
                height: 30.h,
              ),
              DefaultButton(
                  onPress: () {
                    {
                      if (nameController.text.isNotEmpty) {
                        CacheHelper.saveData(
                                key: "name", value: nameController.text)
                            .then((value) {
                          NavigationUtils.navigateTo(
                              context: context, destinationScreen: ChatScreen());
                        });
                      }
                    }
                  },
                  text: "Send")
            ],
          ),
        ),
      ),
    );
  }
}
