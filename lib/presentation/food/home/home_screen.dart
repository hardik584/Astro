import 'package:astro/constants/list_constants.dart';
import 'package:astro/constants/string_constants.dart';
import 'package:astro/presentation/food/detail/bloc/detail_bloc.dart';
import 'package:astro/presentation/food/detail/detail_screen.dart';
import 'package:astro/presentation/food/home/widgets/category_widget.dart';
import 'package:astro/presentation/food/home/widgets/product_widget.dart';
import 'package:astro/presentation/navigation/app_navigator.dart';
import 'package:astro/presentation/themes/color_constants.dart';
import 'package:astro/presentation/themes/text_style_constants.dart';
import 'package:astro/presentation/widgets/components/custom_text_field.dart';
import 'package:astro/presentation/widgets/components/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as drop;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double height, width;

  String? dropdownValue;

  TextEditingController searchFoodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            StringConstants.labelGoodMorningHello,
            style: TextStyleConstants.titleTextStyle,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: ColorConstants.black,
                ))
          ],
          backgroundColor: ColorConstants.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: Spacings.medium,
                  top: 10,
                ),
                child: Text(
                  StringConstants.labelDeliveringTo,
                  style: TextStyleConstants.subtitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: Spacings.medium,
                ),
                child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    iconSize: 24,
                    hint: Text(
                      StringConstants.labelCurrentLocation,
                      style: TextStyleConstants.titleTextStyle,
                    ),
                    elevation: 16,
                    style: TextStyleConstants.titleTextStyle,
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: ListConstants.locationList
                        .map<drop.DropdownMenuItem<String>>((String value) {
                      return drop.DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: Spacings.medium,
                    bottom: Spacings.medium,
                    left: Spacings.medium,
                    right: Spacings.medium),
                child: CustomTextField(
                  textEditingController: searchFoodController,
                  hintText: StringConstants.labelSearchFood,
                  prefixWidget: Icon(
                    Icons.search,
                    color: ColorConstants.black,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.only(
                    top: Spacings.medium, left: Spacings.medium),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ListConstants.foodModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryWidget(
                      foodModel: ListConstants.foodModelList[index],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Spacings.medium),
                child: Text(
                  StringConstants.labelPopularFood,
                  style: TextStyleConstants.titleTextStyle,
                ),
              ),
              SizedBox(
                height: Spacings.medium,
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ListConstants.productModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductWidget(
                    productModel: ListConstants.productModelList[index],
                    onTap: () {
                      AppNavigator.navigateTo(
                          context: context,
                          widget: BlocProvider(
                            create: (_) => DetailBloc(),
                            child: DetailScreen(
                                productModel:
                                    ListConstants.productModelList[index]),
                          ));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
