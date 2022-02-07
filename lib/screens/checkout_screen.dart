import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/providers/cart_provider.dart';
import 'package:shopy/widgets/credit_card_form_widget.dart';
import 'package:shopy/widgets/product/products_list_widget.dart';

class CheckoutScreen extends HookConsumerWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    List<Product> products = ref.watch(cartProvider).products;
    String formattedTotalPrice = ref.watch(cartProvider).formattedTotalPrice;
    final cartNotifier = ref.watch(cartProvider.notifier);

    final isCreditCard = useState(false);

    return Scaffold(
      appBar: const AppBarWidget(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Please select your payment method'),
              const SizedBox(height: 16),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: ButtonWidget(
                      onPressed: () => isCreditCard.value = false,
                      text: 'Cash',
                      secondary: isCreditCard.value,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ButtonWidget(
                      onPressed: () => isCreditCard.value = true,
                      text: 'Credit Card',
                      secondary: !isCreditCard.value,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (isCreditCard.value) const CreditCardFormWidget(),
              const SizedBox(height: 16),
              if (products.isNotEmpty)
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ProductsListWidget(products: products),
                ),
              if (products.isEmpty)
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: const Text('No products in cart')),
              if (products.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text('Total'), Text(formattedTotalPrice)],
                  ),
                ),
              if (products.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text('Shipping'), Text('Free')],
                  ),
                ),
              if (products.isNotEmpty)
                ButtonWidget(text: 'Place order', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
