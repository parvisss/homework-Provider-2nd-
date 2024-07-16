import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/controllers/card_controller.dart';
import 'package:online_shop/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

class PaymentNotifier extends StatelessWidget {
  const PaymentNotifier({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<CardController>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 140,
              color: Color.fromARGB(255, 151, 215, 153),
            ),
            const Text(
              "Payment Successfull!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const Text(
              "Orders will arrive in 3 days!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const Gap(20),
            Flexible(
              child: GridView.builder(
                itemCount: cardController.cart.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180),
                itemBuilder: (ctx, index) {
                  return Center(
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          Flexible(
                            flex: 5,
                            child: Image.network(
                              cardController.cart[index].product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Gap(10),
                          Flexible(
                            child: Text(
                              cardController.cart[index].product.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 151, 215, 153),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => HomeScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 15),
                  child: const Text("Back to Home"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
