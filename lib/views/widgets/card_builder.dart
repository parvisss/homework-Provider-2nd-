import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/controllers/productc_controller.dart';
import 'package:online_shop/views/screens/product_info.dart';
import 'package:provider/provider.dart';

class CardBuilder extends StatelessWidget {
  const CardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final productcController = Provider.of<ProductcController>(context);
    return SliverGrid.builder(
      itemCount: productcController.list.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        mainAxisExtent: 250,
        crossAxisSpacing: 20,
        mainAxisSpacing: 50,
      ),
      itemBuilder: (ctx, index) {
        final product = productcController.list[index];
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
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Gap(5),
                      Text(product.category),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${product.price}"),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              product.isFav
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
                    ),
                  ),  
                );
              },
            ),
            Positioned(
              top: -40,
              left: -40,
              right: 0,
              child: SizedBox(
                height: 140,
                child: Image.network(
                  product.image,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
