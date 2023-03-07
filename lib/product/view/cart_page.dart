import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_api.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_provider.dart';
import 'package:shopify_flutter/dashboard/model/view_cart_response.dart';
import 'package:shopify_flutter/product/attribute_provider/attribute_provider.dart';
import 'package:shopify_flutter/product/attributes_service/attribute_service.dart';
import 'package:shopify_flutter/product/view/shipping_details.dart';
import 'package:shopify_flutter/widget/app_button/app_button_full.dart';
import 'package:shopify_flutter/widget/navigator/navigation_route.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ViewCartModel? getCartDataModel;
  bool loader = false;
  @override
  void initState() {
    getCartData();
    super.initState();
  }

  getCartData() async {
    loader = true;
    setState(() {});
    getCartDataModel = await AttributeService().getCartData(variables: {
      "id": Provider.of<AttributeProvider>(context, listen: false).cartId
    });
    loader = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var getPaymentDetails = [
      {
        "payTitle": "Total",
        "payAmount":
            '\u{20B9} ${getCartDataModel?.cost.checkoutChargeAmount.amount ?? ''}'
      },
      {
        "payTitle": "Taxes",
        "payAmount":
            '\u{20B9} ${getCartDataModel?.cost.totalTaxAmount.amount ?? ''}'
      },
      {
        "payTitle": "Grand Total",
        "payAmount":
            '\u{20B9} ${getCartDataModel?.cost.totalAmount.amount ?? ''}'
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        elevation: 0,
        toolbarHeight: 80.sp,
        leadingWidth: 90.sp,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 15.sp),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_outlined,
              color: Colors.black, size: 20.sp),
        ),
      ),
      body: loader
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 20.sp),
                child: Column(
                  children: [
                    for (int i = 0;
                        i < getCartDataModel!.lines.edges.length;
                        i++)
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                getCartDataModel?.lines.edges[i].node
                                        .merchandise.image.url ??
                                    '',
                                height: 200.sp,
                                width: 200.sp,
                                fit: BoxFit.scaleDown,
                              )
                            ],
                          ),
                          SizedBox(width: 15.sp),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getCartDataModel?.lines.edges[i].node
                                      .merchandise.product.productType ??
                                  ''),
                              for (int j = 0;
                                  j <
                                      getCartDataModel!.lines.edges[i].node
                                          .merchandise.selectedOptions.length;
                                  j++)
                                Row(
                                  children: [
                                    SizedBox(height: 20.sp),
                                    Text(
                                      getCartDataModel
                                              ?.lines
                                              .edges[i]
                                              .node
                                              .merchandise
                                              .selectedOptions[j]
                                              .name ??
                                          '',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15.sp),
                                    ),
                                    Text(
                                      getCartDataModel
                                              ?.lines
                                              .edges[i]
                                              .node
                                              .merchandise
                                              .selectedOptions[j]
                                              .value ??
                                          '',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15.sp),
                                    ),
                                  ],
                                )
                            ],
                          )
                        ],
                      ),
                    SizedBox(height: 30.sp),
                    for (int i = 0; i < getPaymentDetails.length; i++)
                      _getPayment(getPaymentDetails[i]),
                    AppButtonFull(
                        onPressed: _createCheckOutSummit,
                        label: Text(
                          'Place Order',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                        ))
                  ],
                ),
              ),
            ),
    );
  }

  _getPayment(options) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              options['payTitle'],
              style: GoogleFonts.openSans(
                  color: Colors.grey,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            ),
            Text(
              options['payAmount'],
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            )
          ],
        ),
        SizedBox(height: 10.sp),
        const Divider(),
        SizedBox(height: 10.sp),
      ],
    );
  }

  _createCheckOutSummit() {
    MutationProvider mutationProvider =
        Provider.of<MutationProvider>(context, listen: false);
    mutationProvider.mutationResponse({
      "input": {
        "allowPartialAddresses": true,
        "lineItems": [
          {
            "customAttributes": {"key": "This is a checkout", "value": "12345"},
            "quantity": 1,
            "variantId": "gid:\/\/shopify\/ProductVariant\/44201146679600"
          }
        ]
      }
    }, createCheckOut).then((value) {
      log(mutationProvider.data["checkoutCreate"]["checkout"]["id"]);
      Provider.of<AttributeProvider>(context, listen: false).addCheckOutId(
          mutationProvider.data["checkoutCreate"]["checkout"]["id"]);
      NavigationRoute().AnimationRoute(context, const ShippingDetails());
    });
  }
}
