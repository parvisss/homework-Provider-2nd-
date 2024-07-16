import 'package:flutter/material.dart';

class ChipCards extends StatelessWidget {
  const ChipCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Chip(
            label: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("smth"),
            ),
          ),
        );
      },
    );
  }
}
