import 'package:bloodsearchapp/config/const/app/app_colors.dart';
import 'package:bloodsearchapp/config/ulilities/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

// ignore: must_be_immutable
class PhoneNumberWidget extends StatelessWidget {
  TextEditingController phoneCNT;
  void Function(PhoneNumber)? onChanged;
  PhoneNumberWidget({super.key, required this.phoneCNT, this.onChanged});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntlPhoneField(
      flagsButtonPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15.h),
      dropdownIconPosition: IconPosition.trailing,
      pickerDialogStyle: PickerDialogStyle(
          countryNameStyle: TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: 15.h,
      )),
      controller: phoneCNT,
      onCountryChanged: (country) {
        //  log("Max ${country.maxLength}");
      },
      style: GoogleFonts.poppins(
        fontStyle: FontStyle.normal,
        textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: 13.h,
        fontWeight: FontWeight.w600,
        color: context.isDarkMode ? AppColors.white : AppColors.black,
      ),
      keyboardType: TextInputType.phone, // This sets the keyboard to numeric
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // This allows only digits
      ],
      decoration: InputDecoration(
        fillColor: context.isDarkMode ? AppColors.black : AppColors.white,
        prefixIconColor: Colors.grey,
        errorText: null,
        labelText: 'Phone Number',
        // border: InputBorder.none,
        // label: ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: BorderSide(
              width: 1,
              color: context.isDarkMode ? AppColors.white : AppColors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: BorderSide(
              width: 1,
              color: context.isDarkMode ? AppColors.white : AppColors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.w),
          borderSide: BorderSide(
              width: 1,
              color: context.isDarkMode ? AppColors.white : AppColors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.isDarkMode ? AppColors.white : AppColors.black,
            width: 1,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          fontStyle: FontStyle.normal,
          textStyle: Theme.of(context).textTheme.displayLarge,
          color: const Color(0xff474747),
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
      initialCountryCode: 'BD',
      onChanged: onChanged,
      // validator: (value) {
      //   if (value == null || value.number.isEmpty) {
      //     return 'Please enter your phone number';
      //   } else if (value.number.length < 10) {
      //     return 'Please enter a valid phone number';
      //   }
      //   return null;
      // },
    );
  }
}
