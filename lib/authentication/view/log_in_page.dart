import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_api.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_provider.dart';
import 'package:shopify_flutter/authentication/provider/customer_provider.dart';
import 'package:shopify_flutter/authentication/services/storage_services.dart';
import 'package:shopify_flutter/authentication/view/sign_up_page.dart';
import 'package:shopify_flutter/dashboard/view/dash_board_page.dart';
import 'package:shopify_flutter/widget/app_button/app_button_full.dart';
import 'package:shopify_flutter/widget/app_input/app_input_text_outline.dart';
import 'package:shopify_flutter/widget/navigator/navigation_route.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';
import 'package:shopify_flutter/widget/styles/app_styles.dart';
import 'package:shopify_flutter/widget/toast_services.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/logInPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnack(String title) {
    final snackbar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15, color: Colors.red),
    ));
    scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
  }

  bool isButtonLoading = false;

  late final myFocusNode1 = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late final myFocusNode2 = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.sp, 100.sp, 20.sp, 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.sp),
              Text('Welcome Back!', style: AppStyles.instance.loginHeader),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                textInputAction: TextInputAction.next,
                inputController: emailController,
                hintText: 'Email',
                focusNode: myFocusNode1,
                fillColor: myFocusNode1.hasFocus
                    ? Colors.white
                    : AppColors.primaryBorderColor.withOpacity(0.1),
                prefixIcon: Icon(
                  Icons.mail,
                  color: myFocusNode1.hasFocus
                      ? AppColors.primaryColor
                      : AppColors.primaryBorderColor.withOpacity(0.5),
                  size: 15.sp,
                ),
              ),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                textInputAction: TextInputAction.done,
                inputController: passwordController,
                password: true,
                focusNode: myFocusNode2,
                fillColor: myFocusNode2.hasFocus
                    ? Colors.white
                    : AppColors.primaryBorderColor.withOpacity(0.1),
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.password,
                  color: myFocusNode2.hasFocus
                      ? AppColors.primaryColor
                      : AppColors.primaryBorderColor.withOpacity(0.5),
                  size: 15.sp,
                ),
              ),
              SizedBox(height: 40.sp),
              AppButtonFull(
                onPressed: () {
                  isButtonLoading ? null : _onSummitLogin();
                },
                label: isButtonLoading
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
                        'Log in'.toUpperCase(),
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
                  'Don\'t have an account ?',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp),
                ),
                SizedBox(width: 10.sp),
                GestureDetector(
                  onTap: () {
                    NavigationRoute()
                        .AnimationRoute(context, const SignUpPage());
                  },
                  child: Text(
                    ' Sign Up',
                    style: GoogleFonts.openSans(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                        color: Colors.grey),
                  ),
                ),
              ]),
              SizedBox(height: 20.sp),
              const Divider(color: Colors.grey),
              SizedBox(height: 20.sp),
              Center(
                child: GestureDetector(
                  onTap: () {
                    NavigationRoute()
                        .AnimationRoute(context, const DashBoardPage());
                  },
                  child: Text(
                    'Log in as Guest',
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onSummitLogin() {
    if (validate()) {
      setState(() => isButtonLoading = true);
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(() => isButtonLoading = false),
      );
      final MutationProvider mutationProvider =
          Provider.of<MutationProvider>(context, listen: false);
      mutationProvider.mutationResponse({
        "input": {
          "email": emailController.text,
          "password": passwordController.text
        }
      }, createCustomerToken).then((value) async {
        NavigationRoute().AnimationRoute(context, const DashBoardPage());
        Provider.of<CustomerProvider>(context, listen: false).getAccessToken(
            mutationProvider.data["customerAccessTokenCreate"]
                ["customerAccessToken"]["accessToken"]);
        await StorageServices().setJwtToken(
            mutationProvider.data["customerAccessTokenCreate"]
                ["customerAccessToken"]["accessToken"]);
        log(mutationProvider.data["customerAccessTokenCreate"]
            ["customerAccessToken"]["accessToken"]);
      });
    }
  }

  bool validate() {
    if (emailController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      // ToastService().showError('Enter Valid Password');
      return false;
    }
    return true;
  }
}
