import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/widgets/provider_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem["imageUrl"] as String),
                radius: 40,
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete Product?"),
                        content: const Text(
                            "Are you sure you want to delete this product from the cart?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // ---------------------------------------
                              // Handling "NO" button pressed action
                              // ---------------------------------------
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.blue[600]),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // ---------------------------------------
                              // Handling "Yes" button pressed action
                              // ---------------------------------------

                              Provider.of<CartProvider>(context, listen: false)
                                  .deleteProduct(cartItem);

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.red[600]),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text("Size: \$${cartItem['size']}"),
            );
          }),
    );
  }
}
