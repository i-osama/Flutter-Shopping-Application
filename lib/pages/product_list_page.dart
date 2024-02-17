import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_application/global_variable.dart';
import 'package:shop_application/widgets/product_card.dart';
import 'package:shop_application/pages/product_details_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<String> filters = ["All", "Adidas", "Nike", "Puma", "ABC"];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 119, 112, 112)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(35),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Shoes\nCollection",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Expanded(
                  child: TextField(
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    hintText: "Search here",
                    hintStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ))
            ],
          ),
          // ##### Main body
          SizedBox(
            height: 80,
            child: ListView.builder(
                // ------------------------Filter select----------------------
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 223, 219, 219),
                        label: Text(filters[index],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal)),
                        elevation: 10,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 223, 219, 219)),
                      ),
                    ),
                  );
                }),
          ),
          // ----------=-=--=-=-=- Produact list view
          Expanded(
            // *******************************************************************
            //   // ---------- Making Responsive ---------
            //   // ############ Also we can use "Media Query" to handle the responsiveness
            //   // Here I am using Layoutbuilder to handle responsiveness
            //   // Listview and Gridview both have been used
            //   // *******************************************************************
            child: LayoutBuilder(builder: (context, constraints) {
              final myGridAspectRation =
                  constraints.maxWidth < 1010 ? 1.82 : 2.35;

              if (constraints.maxWidth < 650) {
                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(product: product);
                            },
                          ));
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          color: index.isEven
                              ? const Color.fromARGB(255, 217, 230, 228)
                              : const Color.fromARGB(255, 215, 244, 240),
                        ),
                      );
                    });
              } else {
                return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: myGridAspectRation,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(product: product);
                            },
                          ));
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          color: index.isEven
                              ? const Color.fromARGB(255, 217, 230, 228)
                              : const Color.fromARGB(255, 215, 244, 240),
                        ),
                      );
                    });
              }
            }),
          )

          // -----------------------------------------------------------------
          // Expanded(
          //   // *******************************************************************
          //   // ---------- Making Responsive
          //   // Here I am using ternary operator to handle the long screen situation
          //   // Listview and Gridview both have been used
          //   // *******************************************************************
          //   child: size.width < 650
          //       ?
          //       :,
          // )
        ],
      ),
    );
  }
}
