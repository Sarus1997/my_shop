import 'package:flutter/material.dart';
import 'package:my_shop/screens/category/components/product_card.dart';
import 'package:my_shop/models/product.dart';

class CategoryScreen extends StatelessWidget {
  final String initialCategory;

  const CategoryScreen(
    productDetailScreen, {
    super.key,
    this.initialCategory = 'เสื้อผ้า',
  });

  @override
  Widget build(BuildContext context) {
    // สร้างรายการสินค้าจำลอง
    List<Product> products = [];

    if (initialCategory == 'เสื้อผ้า') {
      products = [
        Product(
          id: '1',
          name: 'เสื้อลายดอก',
          price: 599,
          discount: 50,
          imageUrl:
              'https://images.unsplash.com/photo-1551232864-3f0890e580d9?q=80&w=1000',
        ),
        Product(
          id: '2',
          name: 'กางเกงยีนส์',
          price: 899,
          discount: 50,
          imageUrl:
              'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?q=80&w=1000',
        ),
        Product(
          id: '3',
          name: 'เดรสสีขาว',
          price: 1290,
          discount: 50,
          imageUrl:
              'https://images.unsplash.com/photo-1596783074918-c84cb06531ca?q=80&w=1000',
        ),
        Product(
          id: '4',
          name: 'เสื้อโปโล',
          price: 450,
          discount: 50,
          imageUrl:
              'https://images.unsplash.com/photo-1544736779-500e419c3ce8?q=80&w=1000',
        ),
      ];
    } else if (initialCategory == 'เครื่องประดับ') {
      products = [
        Product(
          id: '5',
          name: 'กำไลข้อมือ',
          price: 299,
          discount: 50,
          imageUrl:
              'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?q=80&w=1000',
        ),
        Product(
          id: '6',
          name: 'สร้อยคอเงิน',
          price: 890,
          discount: 50,
          imageUrl:
              'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?q=80&w=1000',
        ),
        Product(
          id: '7',
          name: 'ต่างหูมุก',
          price: 350,
          discount: 50,
          imageUrl:
              'https://images.unsplash.com/photo-1535632066274-810a43b39c44?q=80&w=1000',
        ),
      ];
    } else if (initialCategory == 'รองเท้า') {
      products = [
        Product(
          id: '8',
          name: 'รองเท้าผ้าใบสีขาว',
          price: 1290,
          discount: 30,
          imageUrl:
              'https://images.unsplash.com/photo-1560343090-f0409e92791a?q=80&w=1000',
        ),
        Product(
          id: '9',
          name: 'รองเท้าส้นสูง',
          price: 1590,
          discount: 30,
          imageUrl:
              'https://images.unsplash.com/photo-1519415943484-9fa1873496d4?q=80&w=1000',
        ),
      ];
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              initialCategory,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
