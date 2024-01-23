import 'package:flutter/material.dart';
import 'package:shop_application/global_variable.dart';
import 'package:shop_application/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = ["All", "Adidas", "Nike", "Puma", "ABC"];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 119, 112, 112)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(35),
      ),
    );

    return Scaffold(
      body: SafeArea(
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
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return const ProductCard(
                          title: "Jonny's shoe", price: 44.25);
                    }))
          ],
        ),
      ),
    );
  }
}
