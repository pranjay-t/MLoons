import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String imgUrl;
  final Color bgColor;
  const ProductCard({super.key,required this.title,required this.price,required this.imgUrl,required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return  Card(
      
      color:bgColor,
      elevation: 10,
      child: Padding(
        padding:const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '\$$price',
              style:Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image(
                image: AssetImage(imgUrl),
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
