import 'package:flutter/material.dart';
import 'package:shopy/widgets/input_widget.dart';

class CreditCardFormWidget extends StatelessWidget {
  const CreditCardFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InputWidget(
            hintText: 'Name on card',
            labelText: 'Name on card',
            controller: TextEditingController(),
          ),
          const SizedBox(height: 16),
          InputWidget(
            hintText: 'Card number',
            labelText: 'Card number',
            controller: TextEditingController(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: InputWidget(
                  hintText: 'Expiry date',
                  labelText: 'Expiry date',
                  controller: TextEditingController(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: InputWidget(
                  hintText: 'Security code',
                  labelText: 'Security code',
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InputWidget(
            hintText: 'CVV',
            labelText: 'CVV',
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
