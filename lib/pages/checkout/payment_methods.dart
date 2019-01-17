import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return ListView.builder(
         scrollDirection: Axis.horizontal,
          itemCount: paymentMethods.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildPaymentMethodCard(paymentMethods.elementAt(index));
          });
  
  }
  Widget _buildPaymentMethodCard(String text) {
    return new GestureDetector(
     child: Container(child: 
       Card(
        child: Container(
          width: 100,
          alignment: Alignment.center,
          child: Text(text,textAlign: TextAlign.center),
        ),
      ),)
       
    );
  }

  final paymentMethods = <String>[
    "Mpesa Online",
    "Mpesa Wallet",
    "Cash On Delivery",
    "Paypal"
  ];
}
