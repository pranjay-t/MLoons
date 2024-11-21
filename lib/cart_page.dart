import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart=context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final currCartProduct = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage(currCartProduct['imageUrl'] as String),
            ),
            trailing: GestureDetector(
              onTap: () {
                showDialog(
                  barrierDismissible :false,
                  context: context,
                  builder: (context){
                  return AlertDialog(
                    title: Text('Delete Product',style: Theme.of(context).textTheme.bodySmall,),
                    content:const Text('Are you sure you want to remove this product from cart ?',style:TextStyle(fontWeight: FontWeight.bold),),
                    actions: [
                      TextButton(
                        onPressed: (){
                          context.read<CartProvider>().removeProduct(currCartProduct); //short hand syntax for below code line
                          //Provider.of<CartProvider>(context, listen: false).removeProduct(currCartProduct);
                        Navigator.of(context).pop();
                      },
                      child:const Text('Yes',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                      },
                      child:const Text('No',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                      )
                    ],
                  );
                });
              },
                child: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
            title: Text(
              currCartProduct['title'] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Volumes ${currCartProduct['volume']}'),
          );
        },
      ),
    );
  }
}
