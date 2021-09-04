import 'package:astro/domain/model/product_model.dart';
import 'package:astro/presentation/themes/color_constants.dart';
import 'package:astro/presentation/widgets/components/spacings.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel productModel;
  DetailScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(widget.productModel.foodImage ?? ''))),
              ),
              Positioned(top: 30, child: BackButton()),
              Positioned(
                  top: 80,
                  left: 15,
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      Text(widget.productModel.starRating.toString())
                    ],
                  )),
              Positioned(
                  bottom: 20,
                  left: 15,
                  child: Container(
                    padding: EdgeInsets.all(Spacings.small),
                    decoration: BoxDecoration(
                        color: ColorConstants.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.play_arrow),
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.all(Spacings.medium),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.comment_outlined),
                        SizedBox(
                          width: Spacings.small,
                        ),
                        Text('350')
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.star_outline),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_outline),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Spacings.medium,
                ),

                // ListView.builder(itemBuilder: b)
              ],
            ),
          )
        ],
      ),
    );
  }
}
