import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/controllers/card_controller.dart';
import 'package:online_shop/views/screens/payment_notifier.dart';
import 'package:provider/provider.dart';

class Buy extends StatelessWidget {
  const Buy({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<CardController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Gap(20),
                  ListTile(
                    title: const Text(
                      "Products",
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                    ),
                  ),
                  const Gap(30),
                ],
              ),
            ),
            SliverGrid.builder(
              itemCount: cardController.cart.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200),
              itemBuilder: (ctx, index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 5,
                        child: Image.network(
                          cardController.cart[id].product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Gap(10),
                      Flexible(
                        child: Text(
                          cardController.cart[id].product.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(30),
                    ],
                  ),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: Gap(30),
            ),
            const SliverToBoxAdapter(
              child: Card(
                child: ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.shopping_cart_outlined)],
                  ),
                  title: Text("Shipping"),
                  subtitle: Text("2-3 Days"),
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Card(
                child: ListTile(
                  leading: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.percent)],
                  ),
                  title: const Text("Discount Code"),
                  subtitle:
                      Text("\$-${10 - cardController.cart[id].totalPrice}"),
                  trailing: const Icon(Icons.arrow_right_alt_outlined),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Gap(10),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      "Shipping",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Text(
                      "Free",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      "Products",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Text(
                      "2",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 215, 153),
                      ),
                    ),
                    trailing: Text(
                      "\$${cardController.cart[id].totalPrice}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 215, 153),
                      ),
                    ),
                  ),
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
                          builder: (ctx) => const PaymentNotifier(),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 26.w, vertical: 15),
                      child: const Text("Buy Now"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
