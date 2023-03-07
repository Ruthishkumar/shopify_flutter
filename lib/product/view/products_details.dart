import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_api.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_provider.dart';
import 'package:shopify_flutter/dashboard/model/view_product_attribute_response.dart';
import 'package:shopify_flutter/product/attribute_provider/attribute_provider.dart';
import 'package:shopify_flutter/product/attributes_service/attribute_service.dart';
import 'package:shopify_flutter/product/view/cart_page.dart';
import 'package:shopify_flutter/widget/app_button/app_button_full.dart';
import 'package:shopify_flutter/widget/navigator/navigation_route.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ViewProductAttributeModel? viewProductAttributes;

  @override
  void initState() {
    getPopulateData();
    super.initState();
  }

  bool loader = false;

  getPopulateData() async {
    loader = true;
    setState(() {});
    viewProductAttributes = await AttributeService().getProductVarient(
        variables: {
          "id": Provider.of<AttributeProvider>(context, listen: false).productId
        });
    loader = false;
    setState(() {});
  }

  List titleAmount = [];
  List productId = [];
  List productVarientId = [];

  getTitleData() {
    for (int k = 0; k < viewProductAttributes!.variants.edges.length; k++) {
      titleAmount.add(viewProductAttributes!.variants.edges[k].node.title);
      productId.add(viewProductAttributes!.variants.edges[k].node.price.amount);
      productVarientId.add(viewProductAttributes!.variants.edges[k].node.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        elevation: 0,
        toolbarHeight: 80.sp,
        leadingWidth: 90.sp,
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
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.network(
                          viewProductAttributes?.featuredImage.url ?? '',
                          height: 200.sp,
                          width: 200.sp,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(height: 20.sp),
                        Container(
                          padding:
                              EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                viewProductAttributes?.productType ?? '',
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal),
                              ),
                              getPriceAmount(),
                            ],
                          ),
                        ),
                        for (int i = 0;
                            i < viewProductAttributes!.options.length;
                            i++)
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    20.sp, 20.sp, 20.sp, 20.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        viewProductAttributes!
                                                .options[i].name ??
                                            '',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.sp)),
                                    SizedBox(height: 10.sp),
                                    Row(
                                      children: [
                                        Wrap(
                                          spacing: 20.sp,
                                          runSpacing: 20.sp,
                                          children: [
                                            for (int j = 0;
                                                j <
                                                    viewProductAttributes!
                                                        .options[i]
                                                        .values
                                                        .length;
                                                j++)
                                              GestureDetector(
                                                onTap: () {
                                                  getTitleData();
                                                  int applyText =
                                                      titleAmount.indexOf(
                                                          viewProductAttributes!
                                                              .variants
                                                              .edges[j]
                                                              .node
                                                              .title);
                                                  String value = productId
                                                      .elementAt(applyText);
                                                  log(value.toString());
                                                  log(productId
                                                      .contains(
                                                          viewProductAttributes!
                                                              .variants
                                                              .edges[j]
                                                              .node
                                                              .price
                                                              .amount)
                                                      .toString());
                                                  log('OnTapColor');
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(8.sp),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.sp)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.6),
                                                        blurRadius: 4.0,
                                                        spreadRadius: 1.0,
                                                        offset: const Offset(
                                                            5.0, 5.0),
                                                      )
                                                    ],
                                                  ),
                                                  child: Text(
                                                      viewProductAttributes
                                                              ?.options[i]
                                                              .values[j] ??
                                                          ''),
                                                ),
                                              )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 20.sp),
                  child: Column(
                    children: [
                      AppButtonFull(
                        onPressed: _cartCreate,
                        label: Text(
                          'Add to Cart',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20.sp),
                      AppButtonFull(
                        onPressed: () {},
                        type: AppButtonFullType.secondary,
                        label: Text(
                          'Buy Now',
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  _cartCreate() {
    for (int j = 0; j < viewProductAttributes!.variants.edges.length; j++) {
      getTitleData();
      int applyText = titleAmount
          .indexOf(viewProductAttributes!.variants.edges[j].node.title);
      String productMerchandiseId = productVarientId.elementAt(applyText);
      log(productMerchandiseId.toString());
      log('productMerchandiseId');
      final MutationProvider mutationProvider =
          Provider.of<MutationProvider>(context, listen: false);
      mutationProvider.mutationResponse({
        "input": {
          "attributes": {
            "key": "cart_attribute",
            "value": "This is a cart attribute"
          },
          "lines": [
            {"quantity": 1, "merchandiseId": productMerchandiseId}
          ]
        }
      }, createCart).then((value) {
        Provider.of<AttributeProvider>(context, listen: false)
            .addCartId(mutationProvider.data['cartCreate']['cart']['id']);
        NavigationRoute().AnimationRoute(context, const CartPage());
      });
    }
  }

  Widget getPriceAmount() {
    return Row(
      children: [
        for (int i = 0; i < viewProductAttributes!.variants.edges.length; i++)
          Text(
            productId
                .contains(viewProductAttributes
                        ?.variants.edges[i].node.price.amount ??
                    '')
                .toString(),
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp),
          )
      ],
    );
  }
}
