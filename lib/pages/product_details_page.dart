import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/widgets/provider_cart.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late int selectedSize = 0;
  // void onTap() {
  //   Provider.of<CartProvider>(context, listen: false)
  //       .addProduct(widget.product);
  // }

  @override
  Widget build(BuildContext context) {
    final currentDevieSize = MediaQuery.of(context).size; // For responsiveness

    final primColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Image.asset(
            widget.product['imageUrl'] as String,
          ),
          const Spacer(
            flex: 2,
          ),
          Center(
            child: Container(
              height: 210,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(210, 227, 234, 234)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Text(
                    "\$${widget.product['price']}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    // -----------------------List view---------------------
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (widget.product['size'] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['size'] as List<int>)[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                label: Text(
                                  "\$$size",
                                  style: TextStyle(
                                      color: selectedSize == size
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                backgroundColor:
                                    selectedSize == size ? primColor : null,
                                side: BorderSide(
                                  color: selectedSize == size
                                      ? primColor
                                      : const Color.fromARGB(66, 0, 0, 0),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (selectedSize != 0) {
                            Provider.of<CartProvider>(context, listen: false)
                                .addProduct({
                              'id': widget.product['id'],
                              'title': widget.product['title'],
                              'price': widget.product['price'],
                              'imageUrl': widget.product['imageUrl'],
                              'company': widget.product['company'],
                              'size': selectedSize
                            });

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "Product added successfully!",
                              style: TextStyle(color: Colors.green),
                            )));
                          } else {
                            //  ***************************************
                            //   Scaffold Messenger/ Bottom notification bar
                            //  ***************************************
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Please select a size first!")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Theme.of(context).primaryColor,
                          // **************************** Handled the device responsiveness here ***********************
                          minimumSize: Size(
                              currentDevieSize.width < 65
                                  ? double.infinity
                                  : 350,
                              50),
                        ),
                        child: const Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
