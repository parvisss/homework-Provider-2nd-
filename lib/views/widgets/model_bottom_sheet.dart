import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/controllers/card_controller.dart';
import 'package:online_shop/controllers/productc_controller.dart';
import 'package:online_shop/views/screens/buy.dart';
import 'package:provider/provider.dart';

class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<CardController>(context);
    final productcController = Provider.of<ProductcController>(context);
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
                          child: Text("${cardController.cart.length} items"),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: cardController.cart.length,
                      itemBuilder: (ctx, index) {
                        final card = cardController.cart[id];

                        return Card(
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Image.network(
                                    productcController.list[id].image),
                              ),
                              const Gap(10),
                              Flexible(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(productcController.list[id].title),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            cardController.removeFromCard(
                                                id, id);
                                          },
                                          icon: const Icon(Icons.remove),
                                          color: Colors.grey,
                                        ),
                                        const Gap(10),
                                        Text(
                                          cardController.cart[id].amount
                                              .toString(),
                                        ),
                                        const Gap(10),
                                        IconButton(
                                          onPressed: () {
                                            cardController.addToCard(id, id);
                                          },
                                          icon: const Icon(Icons.add),
                                          color: Colors.grey,
                                        ),
                                        const Gap(15),
                                        const Text(
                                          "|",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const Gap(15),
                                        Text(
                                          "\$${cardController.cart[id].totalPrice}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 151, 215, 153),
                                          ),
                                        ),
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
                  Flexible(
                    flex: 1,
                    child: FilledButton(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 26.w, vertical: 15),
                        child: const Text("Checkout Chart"),
                      ),
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
