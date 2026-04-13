import 'package:flutter/material.dart';
import 'products_service.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final service = ProductsService();
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final data = await service.getProducts();
    setState(() => products = data);
  }

  void _showEditDialog(Map<String, dynamic> product) async {
    final nameController = TextEditingController(text: product["name"]);
    final priceController = TextEditingController(
      text: product["price"].toString(),
    );

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Product"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final price = double.tryParse(priceController.text) ?? 0.0;
              await service.updateProduct(
                product["id"],
                nameController.text,
                price,
              );
              Navigator.pop(context);
              loadProducts();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(products[i]["name"]),
          subtitle: Text("Price: ${products[i]["price"]}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showEditDialog(products[i]),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await service.deleteProduct(products[i]["id"]);
                  loadProducts();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nameController = TextEditingController();
          final priceController = TextEditingController();

          await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Add Product"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: "Price"),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final price = double.tryParse(priceController.text) ?? 0.0;
                    await service.createProduct(nameController.text, price);
                    Navigator.pop(context);
                    loadProducts();
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
