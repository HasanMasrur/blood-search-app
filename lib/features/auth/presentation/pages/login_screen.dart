import 'dart:developer';
import 'package:bloodsearchapp/config/const/app/app_assets.dart';
import 'package:bloodsearchapp/config/const/app/app_colors.dart';
import 'package:bloodsearchapp/config/ulilities/extensions/context_extensions.dart';
import 'package:bloodsearchapp/core/widgets/custom_button.dart';
import 'package:bloodsearchapp/core/widgets/input_field_widget.dart';
import 'package:bloodsearchapp/features/auth/presentation/widgets/login_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:bloodsearchapp/core/error/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController phoneCNT = TextEditingController(text: '');
  final TextEditingController password =
      TextEditingController(text: "password");

  TextEditingController email = TextEditingController(text: "");
  final isPasswordVisible = ValueNotifier(true);
  bool isShowPass = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  late ValueNotifier<PhoneNumber> phoneValue = ValueNotifier(
      PhoneNumber(countryISOCode: '', countryCode: '', number: ''));
  @override
  Widget build(BuildContext context) {
    log(AppAssets.googleSvg);
    return Scaffold(
      backgroundColor: context.isDarkMode ? AppColors.black : AppColors.white,
      //CupertinoColors.systemGroupedBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          50.verticalSpace,
          Expanded(
            flex: 5,
            child: SvgPicture.asset(
              AppAssets.bloodLogo,
              colorFilter:
                  const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              height: 200.h,
            ),
          ),
          Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        Text(
                          "Login",
                          style: TextStyle(
                              color: context.isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22.sp),
                        ),
                        10.verticalSpace,
                        Text(
                          "Login your account with...",
                          style: TextStyle(
                              color: context.isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        25.verticalSpace,
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: context.isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: IntlPhoneField(
                            flagsButtonPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
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
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 13.h,
                              fontWeight: FontWeight.w600,
                              color: context.isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: context.isDarkMode
                                  ? AppColors.black
                                  : AppColors.white,
                              prefixIconColor: Colors.grey,
                              errorText: null,
                              labelText: 'Phone Number',
                              // border: InputBorder.none,
                              // label: ,
                              border: InputBorder.none,
                              //  const OutlineInputBorder(
                              //   borderSide: BorderSide(color: Color(0xffD1D1D6)),
                              // ),
                              focusedBorder: InputBorder.none,
                              //  const OutlineInputBorder(
                              //   borderSide: BorderSide(color: Color(0xffD1D1D6)),
                              // ),
                              errorBorder: InputBorder.none,
                              // const OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     color: Color(0xff474747),
                              //     width: 1,
                              //   ),
                              // ),
                              errorStyle: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                color: const Color(0xff474747),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            initialCountryCode: 'BD',
                            onChanged: (phone) {
                              //   log(phone.countryISOCode);
                              phoneValue.value = phone;
                            },
                          ),
                        ),
                        18.verticalSpace,
                        // password field :
                        ValueListenableBuilder(
                            valueListenable: isPasswordVisible,
                            builder: (context, isVisible, widget) {
                              return InputFieldWidget(
                                sufixIconview: true,
                                prefixIconview: password.value.text.isNotEmpty
                                    ? false
                                    : false,
                                suffixlogo: AppAssets.passwordEye,
                                lable: "Password",
                                hintTitle: "Password",
                                inputController: password,
                                isValid: true,
                                logo: '',
                                onTap: () {
                                  log("called $isVisible");
                                  isPasswordVisible.value =
                                      !isPasswordVisible.value;
                                },
                                passwordVisible: isPasswordVisible.value,
                                validator: (firstName) =>
                                    firstName?.isValid(6, "passsword"),
                              );
                            }),

                        10.verticalSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget password",
                            style: TextStyle(
                                color: context.isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        12.verticalSpace,
                        CustomButton(
                            title: "Sign in",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // Navigator.pushReplacementNamed(
                                //     context, RouteName.dashboardScreen);
                              }
                            }),
                        20.verticalSpace,
                        LoginIconButton(
                          onTap: () async {},
                          title: "Sign Up with Google",
                          icon: AppAssets.googleSvg,
                        ),
                        8.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Don’t have an account?",
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, RouteName.signUp);
                              },
                              child: const Text("Sign Up Now"),
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
