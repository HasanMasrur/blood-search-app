import 'dart:developer';
import 'package:bloodsearchapp/config/const/app/app_assets.dart';
import 'package:bloodsearchapp/config/const/app/app_colors.dart';
import 'package:bloodsearchapp/config/ulilities/extensions/context_extensions.dart';
import 'package:bloodsearchapp/core/widgets/custom_button.dart';
import 'package:bloodsearchapp/core/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:bloodsearchapp/core/error/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController phoneCNT = TextEditingController(text: '');
  final TextEditingController password = TextEditingController(text: "");
  TextEditingController email = TextEditingController(text: "");
  final isPasswordVisible = ValueNotifier(true);
  bool isShowPass = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Male", child: Text("Male")),
      const DropdownMenuItem(value: "Female", child: Text("Female")),
      const DropdownMenuItem(value: "Other", child: Text("Other")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownBloodItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select BloodGroup", child: Text("Select BloodGroup")),
      const DropdownMenuItem(value: "O-", child: Text("O-")),
      const DropdownMenuItem(value: "O+", child: Text("O+")),
      const DropdownMenuItem(value: "A-", child: Text("A-")),
      const DropdownMenuItem(value: "A+", child: Text("A+")),
      const DropdownMenuItem(value: "B-", child: Text("B-")),
      const DropdownMenuItem(value: "B+", child: Text("B+")),
      const DropdownMenuItem(value: "AB-", child: Text("AB-")),
      const DropdownMenuItem(value: "AB+", child: Text("AB+")),
    ];
    return menuItems;
  }

  late final ValueNotifier<String> nationality;
  late final ValueNotifier<String> dob;
  late final ValueNotifier<String> gender;
  late final ValueNotifier<String> bloodGroup;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    dob = ValueNotifier(DateTime.now().toString());
    gender = ValueNotifier("Other");
    bloodGroup = ValueNotifier("Select BloodGroup");
  }

  late ValueNotifier<PhoneNumber> phoneValue = ValueNotifier(
      PhoneNumber(countryISOCode: '', countryCode: '', number: ''));
  @override
  Widget build(BuildContext context) {
    log(AppAssets.googleSvg);
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      backgroundColor: context.isDarkMode ? AppColors.black : AppColors.white,
      //CupertinoColors.systemGroupedBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.verticalSpace,
            Container(
              height: 100.h,
              padding: EdgeInsets.all(20.h), // Adjust the padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Makes the container circular
                border: Border.all(
                  color: AppColors.primary,
                  width: 2.0, // Border width
                ),
              ),
              child: SvgPicture.asset(
                AppAssets.bloodLogo,
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    InputFieldWidget(
                      sufixIconview: false,
                      prefixIconview:
                          password.value.text.isNotEmpty ? false : false,
                      suffixlogo: '',
                      lable: "Full Name",
                      hintTitle: "Full Name",
                      inputController: password,
                      isValid: true,
                      logo: '',
                      onTap: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                      passwordVisible: false,
                      validator: (firstName) =>
                          firstName?.isValid(6, "passsword"),
                    ),
                    8.verticalSpace,
                    InputFieldWidget(
                      sufixIconview: false,
                      prefixIconview:
                          password.value.text.isNotEmpty ? false : false,
                      suffixlogo: '',
                      lable: "Email",
                      hintTitle: "Email",
                      inputController: password,
                      isValid: true,
                      logo: '',
                      onTap: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                      passwordVisible: false,
                      validator: (firstName) =>
                          firstName?.isValid(6, "passsword"),
                    ),
                    8.verticalSpace,
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
                          textStyle: Theme.of(context).textTheme.displayLarge,
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
                          prefixIconColor: context.isDarkMode
                              ? AppColors.white
                              : AppColors.black,
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
                            textStyle: Theme.of(context).textTheme.displayLarge,
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
                    8.verticalSpace,
                    SizedBox(
                      width: 1.sw,
                      height: 60,
                      child: ValueListenableBuilder(
                        valueListenable: gender,
                        builder: (context, valueListenableGender, child) {
                          return DropdownButtonFormField(
                            style: const TextStyle(
                              color: Color(0xffa5a8af),
                              fontSize: 12,
                              fontFamily: "Poppins",
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ),
                            validator: (value) =>
                                value == null ? "Select a gender" : null,
                            value: valueListenableGender,
                            onChanged: (String? newValue) {
                              gender.value = newValue!;
                            },
                            items: dropdownItems,
                          );
                        },
                      ),
                    ),
                    8.verticalSpace,
                    SizedBox(
                      width: 1.sw,
                      height: 60,
                      child: ValueListenableBuilder(
                          valueListenable: dob,
                          builder: (context, valueListenableDOB, child) {
                            return RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  width: valueListenableDOB.isEmpty ? 1 : 1,
                                ),
                              ),
                              onPressed: () async {
                                DateTime? value;

                                value = await show(
                                  context: context,
                                  isReturn: true,
                                  initialDate:
                                      DateTime(DateTime.now().year - 16),
                                  firstDate: DateTime(DateTime.now().year - 70),
                                  lastDate: DateTime(DateTime.now().year - 16),
                                  helpText: "Age range maximum 16",
                                );

                                if (value != null) {
                                  dob.value = value.toIso8601String();
                                  // DateFormat("MMM dd, yyyy").format(value);
                                }
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    dob.value.isNotEmpty
                                        ? DateFormat("MMM dd, yyyy")
                                            .format(DateTime.parse(dob.value))
                                        : "Date of birth",
                                    style: TextStyle(
                                      color: context.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    8.verticalSpace,
                    SizedBox(
                      width: 1.sw,
                      height: 60,
                      child: ValueListenableBuilder(
                        valueListenable: bloodGroup,
                        builder: (context, valueListenableBlood, child) {
                          return DropdownButtonFormField(
                            style: const TextStyle(
                              color: Color(0xffa5a8af),
                              fontSize: 12,
                              fontFamily: "Poppins",
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ),
                            validator: (value) =>
                                value == null ? "Select a BloodGroup" : null,
                            value: valueListenableBlood,
                            onChanged: (String? newValue) {
                              bloodGroup.value = newValue!;
                            },
                            items: dropdownBloodItems,
                          );
                        },
                      ),
                    ),
                    10.verticalSpace,
                    // password field :
                    ValueListenableBuilder(
                        valueListenable: isPasswordVisible,
                        builder: (context, isVisible, widget) {
                          return InputFieldWidget(
                            sufixIconview: true,
                            prefixIconview:
                                password.value.text.isNotEmpty ? false : false,
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
                    CustomButton(
                        title: "Sign in",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Navigator.pushReplacementNamed(
                            //     context, RouteName.dashboardScreen);
                          }
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<DateTime?> show(
      {required BuildContext context,
      required DateTime initialDate,
      required DateTime lastDate,
      required String helpText,
      required DateTime firstDate,
      required bool isReturn}) async {
    return await showDatePicker(
      context: context,
      helpText: helpText,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            canvasColor: Colors.red,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              secondary: Colors.red,
            ),
            // Change the text theme
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.blue),
              bodyMedium: TextStyle(color: Colors.black),
              titleLarge: TextStyle(color: Colors.pink),
              titleMedium: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((selectedDate) {
      if (selectedDate != null) {
        return selectedDate;
      }
      return null;
    }).onError((error, stackTrace) => null);
  }
}
