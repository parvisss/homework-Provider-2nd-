import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/views/widgets/floating_button.dart';
import 'package:online_shop/views/widgets/model_bottom_sheet.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key, required this.id, required this.products});
  final int id;
  final products;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    final product = widget.products[widget.id];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Image.network(product["image"]),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product['category'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          product['title'],
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(fontSize: 25),
                        ),
                        const Gap(30),
                        const Text("Price"),
                        Text(
                          "\$${product['price']}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 151, 215, 153),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(30),
                        const Text("Choose color"),
                        const Gap(30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 5; i++)
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 222, 59),
                              ),
                            const Gap(10),
                            const Text(
                              "5.0",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("124 revoews"),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  Text(
                    product['aboutTitle'],
                    style: const TextStyle(fontSize: 22),
                  ),
                  const Gap(10),
                  Text(
                    product['about'],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70.w,
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 151, 215, 153),
              child: const Text("Add To Card"),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return ModelBottomSheet(
                      id: widget.id,
                      products: widget.products,
                    );
                  },
                );
              },
            ),
          ),
          const Gap(20),
           FloatingButton()
        ],
      ),
    );
  }
}
