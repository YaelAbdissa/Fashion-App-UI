import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqData = [
      {
        "question": "How to order products?",
        "answer":
            "To order products, simply browse the catalog, select your desired items, add them to your cart, and proceed to checkout."
      },
      {
        "question": "How do I track my order?",
        "answer":
            "You can track your order by navigating to the 'My Orders' section in your account and selecting the order you want to track."
      },
      {
        "question": "How do I change the shipping address?",
        "answer":
            "You can update your shipping address before confirming your order from the checkout page or in your account settings."
      },
      {
        "question": "Is the payment system in this application safe?",
        "answer":
            "The payment system in this application is very safe. We use SSL (Secure Socket Layer) data encryption to ensure that all transactions are carried out over a protected connection. Our application also complies with PCI-DSS (Payment Card Industry Data Security Standard) standards, which is the highest standard in the payments industry."
      },
      {
        "question": "What types of payments are available?",
        "answer":
            "We accept various payment methods including credit/debit cards, PayPal, and mobile wallet payments depending on your region."
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Faq",
          style: appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView.separated(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            itemBuilder: (context, index) {
              final item = faqData[index];
              return Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  border: Border.all(color: Colors.black12),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    // trailing: Icon(Icons.keyboard_arrow_up_rounded),
                    tilePadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    childrenPadding: const EdgeInsets.only(
                        top: 10, left: 16, right: 16, bottom: 18),
                    title: Text(
                      item["question"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    children: [
                      Text(
                        item["answer"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, _) {
              return SizedBox(height: 10);
            },
            itemCount: faqData.length),
      ),
    );
  }
}
