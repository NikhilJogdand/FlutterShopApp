import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context)?.settings.arguments as String;
    var productDetails = Provider.of<ProductsProvider>(context, listen: false)
        .findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productDetails.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: Image.network(
                  productDetails.imageUrl,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 21, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '\$${productDetails.price}',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 18, color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 21, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    productDetails.description,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 18, color: Colors.blueGrey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
