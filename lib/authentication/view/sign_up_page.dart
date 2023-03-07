import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_api.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_provider.dart';
import 'package:shopify_flutter/widget/app_button/app_button_full.dart';
import 'package:shopify_flutter/widget/app_input/app_input_text_outline.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';
import 'package:shopify_flutter/widget/styles/app_styles.dart';
import 'package:shopify_flutter/widget/toast_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late final myFocusNode1 = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late final myFocusNode2 = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late final myFocusNode3 = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late final myFocusNode4 = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late final myFocusNode5 = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  bool buttonLoading = false;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.sp, 100.sp, 20.sp, 20.sp),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  Text(
                    'Create Account',
                    style: AppStyles.instance.signUpHeader,
                  ),
                ],
              ),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                textInputAction: TextInputAction.next,
                inputController: firstNameController,
                hintText: 'First Name',
                focusNode: myFocusNode1,
                fillColor: myFocusNode1.hasFocus
                    ? Colors.white
                    : AppColors.primaryBorderColor.withOpacity(0.1),
                prefixIcon: Icon(
                  Icons.drive_file_rename_outline,
                  color: myFocusNode1.hasFocus
                      ? AppColors.primaryColor
                      : AppColors.primaryBorderColor.withOpacity(0.5),
                  size: 15.sp,
                ),
              ),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                  textInputAction: TextInputAction.next,
                  inputController: lastNameController,
                  focusNode: myFocusNode2,
                  fillColor: myFocusNode2.hasFocus
                      ? Colors.white
                      : AppColors.primaryBorderColor.withOpacity(0.1),
                  hintText: 'Last Name',
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline,
                    color: myFocusNode2.hasFocus
                        ? AppColors.primaryColor
                        : AppColors.primaryBorderColor.withOpacity(0.5),
                    size: 15.sp,
                  )),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                  textInputAction: TextInputAction.next,
                  inputController: emailController,
                  focusNode: myFocusNode3,
                  fillColor: myFocusNode3.hasFocus
                      ? Colors.white
                      : AppColors.primaryBorderColor.withOpacity(0.1),
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.mail,
                    color: myFocusNode3.hasFocus
                        ? AppColors.primaryColor
                        : AppColors.primaryBorderColor.withOpacity(0.5),
                    size: 15.sp,
                  )),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                  textInputAction: TextInputAction.next,
                  inputController: phoneNumberController,
                  focusNode: myFocusNode4,
                  fillColor: myFocusNode4.hasFocus
                      ? Colors.white
                      : AppColors.primaryBorderColor.withOpacity(0.1),
                  hintText: 'Mobile Number',
                  isNumber: true,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: myFocusNode4.hasFocus
                        ? AppColors.primaryColor
                        : AppColors.primaryBorderColor.withOpacity(0.5),
                    size: 15.sp,
                  )),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                textInputAction: TextInputAction.done,
                inputController: passwordController,
                focusNode: myFocusNode5,
                fillColor: myFocusNode5.hasFocus
                    ? Colors.white
                    : AppColors.primaryBorderColor.withOpacity(0.1),
                hintText: 'Password',
                password: true,
                prefixIcon: Icon(
                  Icons.password,
                  color: myFocusNode5.hasFocus
                      ? AppColors.primaryColor
                      : AppColors.primaryBorderColor.withOpacity(0.5),
                  size: 15.sp,
                ),
              ),
              SizedBox(height: 40.sp),
              AppButtonFull(
                onPressed: () {
                  buttonLoading ? null : _onSignUpSummit();
                },
                label: buttonLoading
                    ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        'Sign Up'.toUpperCase(),
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                        textAlign: TextAlign.center,
                      ),
              ),
              SizedBox(height: 30.sp),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Already have an account ?',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp),
                ),
                SizedBox(width: 10.sp),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Log In',
                    style: GoogleFonts.openSans(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                        color: Colors.grey),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  _onSignUpSummit() {
    if (validate()) {
      setState(() => buttonLoading = true);
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(() => buttonLoading = false),
      );
      final MutationProvider mutationProvider =
          Provider.of<MutationProvider>(context, listen: false);
      mutationProvider.mutationResponse({
        "input": {
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "email": emailController.text,
          "phone": '+91${phoneNumberController.text}',
          "password": passwordController.text
        }
      }, createCustomer).then((value) {
        Navigator.of(context).pop();
      });
    }
  }

  bool validate() {
    if (firstNameController.text == '') {
      return false;
    } else if (lastNameController.text == '') {
      return false;
    } else if (emailController.text == '') {
      return false;
    } else if (phoneNumberController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    }
    return true;
  }
}
