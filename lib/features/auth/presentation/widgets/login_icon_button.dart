import 'package:bloodsearchapp/config/const/app/app_colors.dart';
import 'package:bloodsearchapp/config/ulilities/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginIconButton extends StatelessWidget {
  const LoginIconButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon});
  final void Function() onTap;
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffEBEBEB)),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            const Spacer(),
            SvgPicture.asset(icon),
            20.horizontalSpace,
            Text(
              title,
              style: TextStyle(
                  color: context.isDarkMode ? AppColors.white : AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
