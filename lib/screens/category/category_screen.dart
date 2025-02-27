import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String selectedCategory = 'ทั้งหมด';

  final List<Product> allProducts = [
    // เสื้อผ้า
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
    // เครื่องประดับ
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
    // รองเท้า
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

  // ฟังก์ชันกรองสินค้าตามหมวดหมู่
  List<Product> getFilteredProducts() {
    if (selectedCategory == 'ทั้งหมด') {
      return allProducts;
    }
    return allProducts.where((product) {
      if (selectedCategory == 'เสื้อผ้า') {
        return ['1', '2', '3', '4'].contains(product.id);
      } else if (selectedCategory == 'เครื่องประดับ') {
        return ['5', '6', '7'].contains(product.id);
      } else if (selectedCategory == 'รองเท้า') {
        return ['8', '9'].contains(product.id);
      }
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = getFilteredProducts();
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // แบนเนอร์โปรโมชัน
          Container(
            height: 120,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor,
                  theme.primaryColor.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.primaryColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'โปรโมชันพิเศษ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'ลดสูงสุด 50% สำหรับสินค้าใหม่',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 64,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // หมวดหมู่สินค้า (Chip เลือกหมวดหมู่)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'หมวดหมู่',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        ['ทั้งหมด', 'เสื้อผ้า', 'เครื่องประดับ', 'รองเท้า'].map(
                          (category) {
                            final isSelected = selectedCategory == category;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = category;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isSelected
                                          ? theme.primaryColor
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight:
                                        isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // จำนวนสินค้าที่แสดง
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'พบ ${products.length} รายการ',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                Row(
                  children: [
                    const Text('เรียงตาม: ', style: TextStyle(fontSize: 14)),
                    const Text(
                      'ล่าสุด',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: theme.primaryColor),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // กริดแสดงสินค้า
          Expanded(
            child:
                products.isEmpty
                    ? const Center(
                      child: Text(
                        'ไม่พบสินค้าในหมวดหมู่นี้',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                    : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        // ใช้ ProductCard ที่มีอยู่แล้ว หรือทำการแทนที่ด้วยการดีไซน์ใหม่ตามด้านล่าง
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // รูปภาพสินค้า
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        product.imageUrl,
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Container(
                                            color: Colors.grey[200],
                                            child: const Center(
                                              child: Icon(
                                                Icons.image_not_supported,
                                                size: 50,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  // แสดงส่วนลด
                                  if (product.discount > 0)
                                    Positioned(
                                      top: 8,
                                      left: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          '-${product.discount}%',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  // ปุ่มโปรด
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.favorite_border,
                                        size: 18,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // ข้อมูลสินค้า
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          '฿${(product.price * (1 - product.discount / 100)).toInt()}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: theme.primaryColor,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        if (product.discount > 0)
                                          Text(
                                            '฿${product.price}',
                                            style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                        // เลือกระหว่างการใช้ ProductCard ที่มีอยู่แล้ว หรือแบบที่ออกแบบใหม่
                        // return ProductCard(product: product);
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
