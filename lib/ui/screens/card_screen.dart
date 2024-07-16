import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/controllers/productc_controller.dart';
import 'package:online_shop/ui/widgets/card_builder.dart';
import 'package:online_shop/ui/widgets/cards_to_slide.dart';
import 'package:online_shop/ui/widgets/floating_button.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardState();
}

class _CardState extends State<CardScreen> {
  final productcController = ProductcController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: productcController.list,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (snapshot == null) {
            return const Center(
              child: Text("Empty data"),
            );
          }
          final products = snapshot.data!.docs;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                        ),
                      ),
                      const Gap(5),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0, left: 5),
                        child: InkWell(
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CardsToSlide(
                products: products,
              ),
              const SliverToBoxAdapter(
                child: Gap(40),
              ),
              const SliverToBoxAdapter(
                child: ListTile(
                  leading: Text(
                    "Have 24 proucts",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Gap(40),
              ),
              CardBuilder(
                products: products,
              ),
            ],
          );
        },
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
