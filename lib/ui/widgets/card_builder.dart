import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/ui/screens/product_info.dart';

class CardBuilder extends StatelessWidget {
  const CardBuilder({super.key, required this.products});
  final List products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        mainAxisExtent: 250,
        crossAxisSpacing: 20,
        mainAxisSpacing: 50,
      ),
      itemBuilder: (ctx, index) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            InkWell(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 120),
                      Text(
                        products[index]["title"],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Gap(5),
                      Text(products[index]['category']),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${products[index]['price']}"),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              products[index]['isFav']
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ProductInfo(
                      id: index,
                      products: products,
                    ),
                  ),
                );
              },
              onLongPress: ()async{},
            ),
            Positioned(
              top: -40,
              left: -40,
              right: 0,
              child: SizedBox(
                height: 140,
                child: Image.network(
                  products[index]['image'],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
