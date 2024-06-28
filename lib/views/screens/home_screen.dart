import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/views/widgets/card_builder.dart';
import 'package:online_shop/views/widgets/cards_to_slide.dart';
import 'package:online_shop/views/widgets/floating_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> list = ["Popular", "New", "Best silling", "Fashion", "Brand"];

class _HomeScreenState extends State<HomeScreen> {
  String dropDownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
          const CardsToSlide(),
          const SliverToBoxAdapter(
            child: Gap(40),
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
