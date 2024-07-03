import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/views/screens/special_offers.dart';

class CardsToSlide extends StatelessWidget {
  const CardsToSlide({super.key,required this.products});
  final List products;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider(
        items: [1, 2, 3].map(
          (i) {
            return InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.amber,
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Slide $i',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (Ctx) => SpecialOffers(products: products,),
                  ),
                );
              },
            );
          },
        ).toList(),
        options: CarouselOptions(height: 200),
      ),
    );
  }
}
