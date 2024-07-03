import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/views/screens/buy.dart';

class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({super.key, required this.id, required this.products});
  final int id;
  final List products;

  @override
  Widget build(BuildContext context) {
    final product = products[id];
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 400.h,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "My Card",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      const Gap(10),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 151, 215, 153),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${products.length} items"),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Image.network(product['image']),
                              ),
                              const Gap(10),
                              Flexible(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(product['title']),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            ;
                                          },
                                          icon: const Icon(Icons.remove),
                                          color: Colors.grey,
                                        ),
                                        const Gap(10),
                                        const Gap(10),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.add),
                                          color: Colors.grey,
                                        ),
                                        const Gap(15),
                                        const Text(
                                          "|",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const Gap(15),
                                        // Text(
                                        //   // "\$${products[id].}",
                                        //   style: const TextStyle(
                                        //     fontSize: 14,
                                        //     color: Color.fromARGB(
                                        //         255, 151, 215, 153),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    const Gap(10),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Black"),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 151, 215, 153),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Buy(
                            id: id,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 26.w, vertical: 15),
                      child: const Text("Checkout Chart"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
