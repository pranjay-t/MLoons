import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/products_details.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> filters = [
    'All',
    'Naruto',
    'AoT',
    'One Piece',
    'Bleach',
    'DragonBall'
  ];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(181, 178, 183, 1),
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
    );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Manga\nCollections',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        label: Text(filter),
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context,constraints){
                if(constraints.maxWidth > 1032){
                  return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final currProduct = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductsDetails(product: currProduct);
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              title: currProduct['title'] as String,
                              price: currProduct['price'] as int,
                              imgUrl: currProduct['imageUrl'] as String,
                              bgColor: index % 2 == 0
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                            ),
                          );
                        });
                }
                else {
                  return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final currProduct = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductsDetails(product: currProduct);
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              title: currProduct['title'] as String,
                              price: currProduct['price'] as int,
                              imgUrl: currProduct['imageUrl'] as String,
                              bgColor: index % 2 == 0
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                            ),
                          );
                        });
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
