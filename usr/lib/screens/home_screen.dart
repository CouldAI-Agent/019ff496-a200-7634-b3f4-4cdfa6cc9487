import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bipin Kirana Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storeProvider.categories.length,
                itemBuilder: (context, index) {
                  final cat = storeProvider.categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.green.shade100,
                          child: Icon(Icons.category, color: Colors.green.shade700),
                        ),
                        const SizedBox(height: 5),
                        Text(cat.name),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Featured Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: storeProvider.products.length,
              itemBuilder: (context, index) {
                final product = storeProvider.products[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey.shade200,
                          width: double.infinity,
                          child: const Icon(Icons.image, size: 50, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('₹${product.discountPrice}', style: const TextStyle(color: Colors.green)),
                            ElevatedButton(
                              onPressed: () => storeProvider.addToCart(product.id),
                              child: const Text('Add'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
