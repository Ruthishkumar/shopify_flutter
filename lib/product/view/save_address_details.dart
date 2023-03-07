import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopify_flutter/product/attribute_provider/attribute_provider.dart';
import 'package:shopify_flutter/product/view/web_view_payment_page.dart';
import 'package:shopify_flutter/widget/navigator/navigation_route.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';
import 'package:shopify_flutter/widget/styles/app_styles.dart';

class SaveAddressDetails extends StatefulWidget {
  const SaveAddressDetails({Key? key}) : super(key: key);

  @override
  State<SaveAddressDetails> createState() => _SaveAddressDetailsState();
}

class _SaveAddressDetailsState extends State<SaveAddressDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        bottomNavigationBar: Row(children: [
          Expanded(
              child: SizedBox(
            height: 46.sp,
            child: OutlinedButton(
              onPressed: () {
                NavigationRoute()
                    .AnimationRoute(context, const WebViewPaymentPage());
              },
              style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  backgroundColor: AppColors.primaryColor),
              child: Text(
                'Continue',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
            ),
          ))
        ]),
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
                      'Order Summary',
                      style: AppStyles.instance.signUpHeader,
                    ),
                  ],
                ),
                SizedBox(height: 40.sp),
                Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          blurRadius: 15.0,
                          spreadRadius: 5.0,
                          offset: const Offset(5.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver to:',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp),
                      ),
                      SizedBox(height: 15.sp),
                      Row(
                        children: [
                          Text(
                            '${Provider.of<AttributeProvider>(context, listen: false).saveUserAddress["firstName"]} ${Provider.of<AttributeProvider>(context, listen: false).saveUserAddress["lastName"]}',
                            style: AppStyles.instance.sAddressDetails,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.sp),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${Provider.of<AttributeProvider>(context, listen: false).saveUserAddress["address1"]}, ${Provider.of<AttributeProvider>(context, listen: false).saveUserAddress["address2"]} ${Provider.of<AttributeProvider>(context, listen: false).saveUserAddress["city"]} ${Provider.of<AttributeProvider>(context, listen: false).saveUserAddress["zip"]}',
                              style: AppStyles.instance.sAddressDetails,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        Provider.of<AttributeProvider>(context, listen: false)
                            .saveUserAddress["phone"],
                        style: AppStyles.instance.sAddressDetails,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
