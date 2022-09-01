import 'package:chatodc/core/styles/colors/app_colors.dart';
import 'package:chatodc/core/styles/texts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/format_date.dart';
import '../../models/message.dart';

class MessageItem extends StatelessWidget {
  MessageItem({
    Key? key,
    required this.message,
    required this.fromMe,
  }) : super(key: key);
  Message message;
  bool fromMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.h),
          margin: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: fromMe ? AppColors.primaryColor : Colors.grey.shade200,
          ),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.name,
                style: AppTextStyle.title().copyWith(
                    color: fromMe ? Colors.white : Colors.grey.shade800),
              ),
              Text(
                message.text,
                style: AppTextStyle.bodyText().copyWith(
                    color: fromMe ? Colors.white : Colors.grey.shade800),
              ),
              Text(
                formatDate(message.time),textAlign: TextAlign.end,
                style: AppTextStyle.subTitle(),
              )
            ],
          )),
        ),
      ],
    );
  }
}
