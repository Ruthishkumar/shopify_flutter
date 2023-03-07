import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_api.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_provider.dart';
import 'package:shopify_flutter/product/attribute_provider/attribute_provider.dart';
import 'package:shopify_flutter/product/view/save_address_details.dart';
import 'package:shopify_flutter/widget/app_button/app_button_full.dart';
import 'package:shopify_flutter/widget/app_input/app_input_text_outline.dart';
import 'package:shopify_flutter/widget/navigator/navigation_route.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';
import 'package:shopify_flutter/widget/styles/app_styles.dart';

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController flatAddressController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  Map<String, dynamic> deliveryDetails = {};

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
  late final myFocusNode6 = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late final myFocusNode7 = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  late final myFocusNode8 = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
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
                    'Delivery Address',
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
                  inputController: phoneNumberController,
                  focusNode: myFocusNode3,
                  fillColor: myFocusNode3.hasFocus
                      ? Colors.white
                      : AppColors.primaryBorderColor.withOpacity(0.1),
                  hintText: 'Mobile Number',
                  isNumber: true,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: myFocusNode3.hasFocus
                        ? AppColors.primaryColor
                        : AppColors.primaryBorderColor.withOpacity(0.5),
                    size: 15.sp,
                  )),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                  textInputAction: TextInputAction.next,
                  inputController: flatAddressController,
                  focusNode: myFocusNode4,
                  fillColor: myFocusNode4.hasFocus
                      ? Colors.white
                      : AppColors.primaryBorderColor.withOpacity(0.1),
                  hintText: 'Enter Flat No',
                  prefixIcon: Icon(
                    Icons.home,
                    color: myFocusNode4.hasFocus
                        ? AppColors.primaryColor
                        : AppColors.primaryBorderColor.withOpacity(0.5),
                    size: 15.sp,
                  )),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                  textInputAction: TextInputAction.next,
                  inputController: addressController,
                  focusNode: myFocusNode5,
                  fillColor: myFocusNode5.hasFocus
                      ? Colors.white
                      : AppColors.primaryBorderColor.withOpacity(0.1),
                  hintText: 'Enter Street Name',
                  prefixIcon: Icon(
                    Icons.home,
                    color: myFocusNode5.hasFocus
                        ? AppColors.primaryColor
                        : AppColors.primaryBorderColor.withOpacity(0.5),
                    size: 15.sp,
                  )),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                textInputAction: TextInputAction.next,
                inputController: cityController,
                focusNode: myFocusNode6,
                fillColor: myFocusNode6.hasFocus
                    ? Colors.white
                    : AppColors.primaryBorderColor.withOpacity(0.1),
                hintText: 'Enter City',
                prefixIcon: Icon(
                  Icons.location_city,
                  color: myFocusNode6.hasFocus
                      ? AppColors.primaryColor
                      : AppColors.primaryBorderColor.withOpacity(0.5),
                  size: 15.sp,
                ),
              ),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                textInputAction: TextInputAction.next,
                inputController: stateController,
                focusNode: myFocusNode7,
                fillColor: myFocusNode7.hasFocus
                    ? Colors.white
                    : AppColors.primaryBorderColor.withOpacity(0.1),
                hintText: 'Enter State',
                prefixIcon: Icon(
                  Icons.location_city,
                  color: myFocusNode7.hasFocus
                      ? AppColors.primaryColor
                      : AppColors.primaryBorderColor.withOpacity(0.5),
                  size: 15.sp,
                ),
              ),
              SizedBox(height: 40.sp),
              AppInputTextOutline(
                textInputAction: TextInputAction.done,
                inputController: zipCodeController,
                focusNode: myFocusNode8,
                fillColor: myFocusNode8.hasFocus
                    ? Colors.white
                    : AppColors.primaryBorderColor.withOpacity(0.1),
                hintText: 'Enter Pincode',
                isNumber: true,
                prefixIcon: Icon(
                  Icons.location_city,
                  color: myFocusNode8.hasFocus
                      ? AppColors.primaryColor
                      : AppColors.primaryBorderColor.withOpacity(0.5),
                  size: 15.sp,
                ),
              ),
              SizedBox(height: 40.sp),
              AppButtonFull(
                onPressed: _placeOrderSummit,
                label: Text(
                  'Save Address',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30.sp),
            ],
          ),
        ),
      ),
    );
  }

  _placeOrderSummit() {
    MutationProvider mutationProvider =
        Provider.of<MutationProvider>(context, listen: false);
    mutationProvider.mutationResponse({
      "input": {
        "allowPartialAddresses": true,
        "shippingAddress": {
          "address1": flatAddressController.text,
          "address2": addressController.text,
          "city": cityController.text,
          "country": "India",
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "phone": "+91${phoneNumberController.text}",
          "province": stateController.text,
          "zip": zipCodeController.text
        },
        "lineItems": [
          {
            "customAttributes": {"key": "This is a checkout", "value": "12345"},
            "quantity": 1,
            "variantId": "gid:\/\/shopify\/ProductVariant\/44201146679600"
          }
        ]
      }
    }, createCheckOut).then((value) {
      setState(() {
        deliveryDetails = {
          "firstName": mutationProvider.data["checkoutCreate"]["checkout"]
              ["shippingAddress"]["firstName"],
          "lastName": mutationProvider.data["checkoutCreate"]["checkout"]
              ["shippingAddress"]["lastName"],
          "phone": mutationProvider.data["checkoutCreate"]["checkout"]
              ["shippingAddress"]["phone"],
          "address1": mutationProvider.data["checkoutCreate"]["checkout"]
              ["shippingAddress"]["address1"],
          "address2": mutationProvider.data["checkoutCreate"]["checkout"]
              ["shippingAddress"]["address2"],
          "city": mutationProvider.data["checkoutCreate"]["checkout"]
              ["shippingAddress"]["city"],
          "zip": mutationProvider.data["checkoutCreate"]["checkout"]
              ["shippingAddress"]["zip"],
        };
      });
      log(mutationProvider.data["checkoutCreate"]["checkout"]["webUrl"]);
      Provider.of<AttributeProvider>(context, listen: false)
          .saveAddressSummary(deliveryDetails);
      Provider.of<AttributeProvider>(context, listen: false).redirectPaymentUrl(
          mutationProvider.data["checkoutCreate"]["checkout"]["webUrl"]);
      NavigationRoute().AnimationRoute(context, const SaveAddressDetails());
    });
  }
}
