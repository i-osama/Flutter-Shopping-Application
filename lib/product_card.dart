import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final dynamic color;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              Text(
                "\$${price.toString()}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Center(
                child: Image.asset(
                  image,
                  height: 180,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
