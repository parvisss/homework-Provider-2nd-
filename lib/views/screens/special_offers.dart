import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/views/widgets/card_builder.dart';
import 'package:online_shop/views/widgets/floating_button.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: const Color.fromARGB(255, 151, 215, 153),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Living Room",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
              ),
              centerTitle: true,
              background: Image.network(
                "https://static.asianpaints.com/content/dam/asianpaintsbeautifulhomes/home-decor-advice/guides-and-how-tos/choosing-living-room-furniture/Title-living-room-interior-design.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: ListTile(
              leading: Text(
                "Have 24 proucts",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Text("data"),
            ),
          ),
          const SliverToBoxAdapter(
            child: Gap(40),
          ),
          const CardBuilder(),
        ],
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
