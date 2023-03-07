import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopify_flutter/dashboard/model/view_collection_response.dart';
import 'package:shopify_flutter/dashboard/model/view_products_response.dart';
import 'package:shopify_flutter/dashboard/product_service/product_service.dart';
import 'package:shopify_flutter/product/attribute_provider/attribute_provider.dart';
import 'package:shopify_flutter/product/view/products_details.dart';
import 'package:shopify_flutter/widget/navigator/navigation_route.dart';
import 'package:shopify_flutter/widget/styles/app_colors.dart';
import 'package:shopify_flutter/widget/styles/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductEdgeModel> getProductsEdges = [];
  List<CollectionEdgeModel> getCollectionEdges = [];

  @override
  void initState() {
    getProductData();
    getCollectionsData();
    getProviderData();
    super.initState();
  }

  getCollectionsData() async {
    getCollectionEdges =
        await ProductService().getCollections(variables: {"first": 10});
    log(getCollectionEdges.length.toString());
    log('TotalCollection');
    setState(() {});
  }

  getProviderData() async {
    Provider.of<AttributeProvider>(context, listen: false)
        .changeProductListing(value: '');
  }

  getProductData() async {
    getProductsEdges =
        await ProductService().getProducts(variables: {"first": 10});
    setState(() {});
  }

  bool loader = false;

  @override
  Widget build(BuildContext context) {
    var gridListColor = [
      {"imageBgColor": Colors.blueGrey},
      {"imageBgColor": Colors.yellow.withOpacity(0.5)},
      {"imageBgColor": Colors.redAccent},
      {"imageBgColor": Colors.grey},
      {"imageBgColor": Colors.pink},
      {"imageBgColor": Colors.green},
    ];
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_rounded,
          color: AppColors.primaryColor,
        ),
        leadingWidth: 80,
        elevation: 0,
        titleSpacing: 5,
        backgroundColor: AppColors.appBackgroundColor,
        centerTitle: true,
        title: Text(
          'ShopZee',
          style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 15.sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (int i = 0; i < getCollectionEdges.length; i++)
                          GestureDetector(
                            onTap: () {
                              log(getCollectionEdges[i].node.id);
                              Provider.of<AttributeProvider>(context,
                                      listen: false)
                                  .changeProductListing(
                                      value: getCollectionEdges[i].node.id);
                              log(Provider.of<AttributeProvider>(context,
                                      listen: false)
                                  .getProductId);
                              log('fsdjsjsdjsahdjs');
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0,
                                      offset: const Offset(5.0, 5.0),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.sp))),
                              child: Text(
                                getCollectionEdges[i].node.title,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.sp),
                              ),
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),
              Consumer<AttributeProvider>(builder: (context, newValue, child) {
                return loader
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(newValue.getProductId),
                        ],
                      );
              }),
              // Text(
              //     '${Provider.of<AttributeProvider>(context, listen: false).getProductId}'),
              SizedBox(height: 10.sp),
              Text(
                'Match Your Style',
                style: AppStyles.instance.homePageHeader,
              ),
              SizedBox(height: 15.sp),
              TextFormField(
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 11.0),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.poppins(
                      color: Colors.grey.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0.sp),
                    borderSide: BorderSide(width: 1.sp, color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0.sp),
                    borderSide: BorderSide(width: 1.sp, color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0.sp),
                    borderSide:
                        BorderSide(width: 1.sp, color: AppColors.primaryColor),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 15.sp,
                  ),
                ),
              ),
              SizedBox(height: 30.sp),
              for (int i = 0; i < getCollectionEdges.length; i++)
                Consumer<AttributeProvider>(
                  builder: (context, getData, child) {
                    return getData.providerCollection[i].node.id != ''
                        ? loader
                            ? const Center(child: CircularProgressIndicator())
                            : GridView.builder(
                                itemCount: getData.providerCollection[i].node
                                    .products.edges.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 230.sp,
                                        crossAxisSpacing: 5.sp),
                                itemBuilder: (BuildContext context, int index) {
                                  Map color = gridListColor[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          log(getData.providerCollection[i].node
                                              .products.edges[index].node.id);
                                          log('ProductId');
                                          Provider.of<AttributeProvider>(
                                                  context,
                                                  listen: false)
                                              .addProductId(getData
                                                  .providerCollection[i]
                                                  .node
                                                  .products
                                                  .edges[index]
                                                  .node
                                                  .id);
                                          NavigationRoute().AnimationRoute(
                                              context, const ProductDetails());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8.sp),
                                          decoration: BoxDecoration(
                                              color: color["imageBgColor"],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.sp))),
                                          child: Image.network(
                                            getData
                                                .providerCollection[i]
                                                .node
                                                .products
                                                .edges[index]
                                                .node
                                                .featuredImage
                                                .url,
                                            fit: BoxFit.scaleDown,
                                            height: 100.sp,
                                            width: 100.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.sp),
                                      Text(
                                        getData.providerCollection[i].node
                                            .products.edges[index].node.title,
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      SizedBox(height: 10.sp),
                                      Text(
                                        '\u{20B9} ${getData.providerCollection[i].node.products.edges[index].node.priceRange.minVariantPrice.amount}',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              )
                        : Text('No Product Found');
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
