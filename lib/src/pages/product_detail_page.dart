import 'package:campus_eats_flutter/src/pages/components/summary_card.dart';
import 'package:campus_eats_flutter/src/utils/color_changing_button.dart';
import 'package:campus_eats_flutter/src/utils/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:campus_eats_flutter/src/models/product_detail.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductDetail productDetail;

  ProductDetailPage({Key? key, required this.productDetail})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedQuantity = 0;

  void updateShowCard(bool value, int price) {
    setState(() {
      selectedQuantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.productDetail
                      .photo!, 
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 320, right: 16, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(); // Navegar hacia atrás
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                           //ColorChangingButton(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.productDetail.name!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 9,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.productDetail.price}",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    QuantitySelector(
                      initialValue: selectedQuantity,
                      onChanged: (newQuantity) {
                        setState(() {
                          selectedQuantity = newQuantity;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 70),
                Text(
                  widget.productDetail.description!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          summaryCard(selectedQuantity, widget.productDetail.price!)
        ],
      ),
      bucket: PageStorageBucket(),
      ), 
    );
  }
}
