import 'dart:developer';
import 'package:bloodsearchapp/config/const/app/app_assets.dart';
import 'package:bloodsearchapp/config/const/app/app_colors.dart';
import 'package:bloodsearchapp/config/navigation/route_name.dart';
import 'package:bloodsearchapp/config/ulilities/enum/bloc_api_state.dart';
import 'package:bloodsearchapp/config/ulilities/extensions/context_extensions.dart';
import 'package:bloodsearchapp/core/widgets/custom_button.dart';
import 'package:bloodsearchapp/core/widgets/input_field_widget.dart';
import 'package:bloodsearchapp/features/auth/data/models/loginUc.dart';
import 'package:bloodsearchapp/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:bloodsearchapp/features/auth/presentation/cubit/login/login_state.dart';
import 'package:bloodsearchapp/features/auth/presentation/widgets/login_icon_button.dart';
import 'package:bloodsearchapp/features/auth/presentation/widgets/phone_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:bloodsearchapp/core/error/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneCNT = TextEditingController(text: '');
  final TextEditingController password = TextEditingController(text: "");
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            100.verticalSpace,
            Container(
              height: 150.h,
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
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    Text(
                      "Login ",
                      style: TextStyle(
                          color: context.isDarkMode
                              ? AppColors.white
                              : AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp),
                    ),
                    25.verticalSpace,
                    PhoneNumberWidget(
                      phoneCNT: phoneCNT,
                      onChanged: (PhoneNumber phone) {
                        log(phone.countryISOCode);
                        phoneValue.value = phone;
                      },
                    ),
                    12.verticalSpace,
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
                    BlocConsumer<LoginCubit, LoginState>(
                        builder: (context, state) {
                      if (state.apiState == NormalApiState.loading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: AppColors.primary,
                          ),
                        );
                      }
                      return CustomButton(
                          title: "Sign in",
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              if (phoneCNT.text.isEmpty ||
                                  phoneValue.value.countryCode.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Requried Phone number !')),
                                );
                                return;
                              }
                              context.read<LoginCubit>().login(LogInUc(
                                  countryCode: phoneValue.value.countryCode,
                                  phone: phoneCNT.text,
                                  password: password.text));
                            }
                          });
                    }, listener: (context, state) {
                      switch (state.apiState) {
                        case NormalApiState.loading:
                          break;
                        case NormalApiState.loaded:
                          Navigator.pushNamed(
                              context, RouteName.dashboardScreen);
                          break;
                        case NormalApiState.failure:
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)),
                          );
                          break;
                        default:
                          log("default");
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
                            Navigator.pushNamed(
                                context, RouteName.signUpScreen);
                          },
                          child: const Text("Sign Up Now"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
