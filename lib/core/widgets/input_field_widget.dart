import 'package:bloodsearchapp/config/const/app/app_colors.dart';
import 'package:bloodsearchapp/config/ulilities/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFieldWidget extends StatelessWidget {
  final String logo;
  final String? suffixlogo;
  final String lable;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final TextEditingController inputController;
  final int? maxLine;
  final bool prefixIconview;
  final bool sufixIconview;
  final bool passwordVisible;
  final bool? isValid;
  final String? hintTitle;
  final TextInputType? keyboardType;
  final Color? borderColor;

  const InputFieldWidget(
      {super.key,
      required this.logo,
      this.suffixlogo,
      this.onTap,
      this.isValid,
      this.keyboardType,
      required this.lable,
      this.validator,
      required this.inputController,
      this.borderColor,
      this.maxLine,
      this.hintTitle,
      required this.sufixIconview,
      required this.passwordVisible,
      required this.prefixIconview});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.isDarkMode ? AppColors.white : AppColors.black,
      controller: inputController,
      validator: isValid == true ? validator : null,
      obscureText: passwordVisible,
      maxLines: maxLine ?? 1,
      keyboardType: keyboardType,
      style: GoogleFonts.poppins(
        fontSize: 14.h,
        fontWeight: FontWeight.w400,
        color: context.isDarkMode ? AppColors.white : AppColors.black,
        fontStyle: FontStyle.normal,
        textStyle: Theme.of(context).textTheme.displayLarge,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(15.w),
        suffixIcon: sufixIconview
            ? Padding(
                padding: EdgeInsets.all(12.w),
                child: GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    suffixlogo!,
                    color:
                        context.isDarkMode ? AppColors.white : AppColors.black,
                    height: 20.h,
                  ),
                ),
              )
            : null,
        // contentPadding: EdgeInsets.only(left: 10.w),
        prefixIcon: prefixIconview
            ? Padding(
                padding: EdgeInsets.all(12.w),
                child: SvgPicture.asset(
                  logo,
                  // colorFilter: ColorFilter.mode(
                  //     context.isDarkMode ? AppColors.white : AppColors.black,
                  //     BlendMode.color),
                  height: 20.h,
                ),
              )
            : null,
        //    labelText: label,
        filled: true, //<-- SEE HERE
        fillColor: context.isDarkMode ? AppColors.black : AppColors.white,
        //<-- SEE HERE
        //  cursorColor: Colors.redAccent,
        hintText: hintTitle,
        labelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 14.h,
          color: context.isDarkMode ? AppColors.white : const Color(0xff4C4D54),
          fontStyle: FontStyle.normal,
          textStyle: Theme.of(context).textTheme.displayLarge,
        ),

        hintStyle: GoogleFonts.poppins(
          color: context.isDarkMode ? AppColors.white : const Color(0xff8E8E93),
          fontWeight: FontWeight.w400,
          fontSize: 14.h,
          fontStyle: FontStyle.normal,
          textStyle: Theme.of(context).textTheme.displayLarge,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: .8,
            color: context.isDarkMode
                ? AppColors.white
                : borderColor != null
                    ? borderColor!
                    : AppColors.gray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: .8,
            color: context.isDarkMode
                ? AppColors.white
                : borderColor != null
                    ? borderColor!
                    : AppColors.gray,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: .8,
            color: context.isDarkMode
                ? AppColors.white
                : borderColor != null
                    ? borderColor!
                    : AppColors.gray,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: .8,
            color: context.isDarkMode
                ? AppColors.white
                : borderColor != null
                    ? borderColor!
                    : AppColors.gray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: .8,
            color: context.isDarkMode
                ? AppColors.white
                : borderColor != null
                    ? borderColor!
                    : AppColors.gray,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          color: Colors.redAccent,
          fontSize: 10.h,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          textStyle: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
