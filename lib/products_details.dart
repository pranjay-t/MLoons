import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductsDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductsDetails({super.key, required this.product});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  int selectedVlm = 0;
  void onClick() {
    if(selectedVlm!=0){
      context.read<CartProvider>()
        .addProduct(
          {
            'id':widget.product['id'],
            'title':widget.product['title'],
            'price':widget.product['price'],
            'imageUrl':widget.product['imageUrl'],
            'company':widget.product['company'],
            'volume':selectedVlm,
          }
        );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Manga added to your Cart')));

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select your manga volume')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Details', style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 1),
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                image: AssetImage(
                  widget.product['imageUrl'] as String,
                ),
                height: 250,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 250,
              color: const Color.fromARGB(255, 245, 241, 241),
              child: Column(
                children: [
                  Text(
                    '\$${widget.product['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Volumes',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          (widget.product['volumes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final currVlm =
                            (widget.product['volumes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedVlm = currVlm;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedVlm == currVlm
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              label: Text(currVlm.toString()),
                              labelStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: onClick,
                    child: Container(
                      width: 350,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.shopping_cart),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add to Cart',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
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