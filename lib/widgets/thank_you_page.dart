import 'package:email_app_task/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                'https://cdn.shopify.com/s/files/1/0569/6867/5527/files/finalised_logo_-_cropped.jpg?14393',
                width: 180,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getRegularBodyText(
                   text: 'Thank you for your purchase!',
                      fontSize: 24.0,
                  ),
                  getHeight(height: 20.0),
                  getRegularBodyText(
                   text: "Hi Sparks, we're getting your order ready to be shipped. We will notify you when it has been sent.",
                      fontSize: 16.0,
                      fontColor: Colors.grey,
                  ),
                  getHeight(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: getRegularBodyText(text: 'View your order'),
                  ),
                  getHeight(height: 10.0),
                  getRegularBodyText(
                    text: 'or',
                    textAlign: TextAlign.center,
                  ),
                  getHeight(height: 10.0),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: getRegularBodyText(text: 'Visit our store'),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getRegularBodyText(
                    text: 'Order summary',
                      fontSize: 20.0,

                  ),
                  getHeight(height: 20.0),
                  // Add your order summary items here
                  // Example:
                  OrderSummaryItem(
                    title: 'Happilo 100% Natural Premium California Almonds',
                    variant: '200g',
                    price: '₹275.00',
                  ),
                  getHeight(height: 20.0),
                  // Add more order summary items if needed
                  // Example:
                  OrderSummaryItem(
                    title: 'Another Product',
                    variant: 'Variant',
                    price: '₹123.45',
                  ),
                  getHeight(height: 20.0),
                  const Divider(),
                  getHeight(height: 20.0),
                  // Subtotal, Discount, Shipping, Taxes, and Total
                  OrderSummaryRow(
                    title: 'Subtotal',
                    value: '₹256.25',
                  ),
                  OrderSummaryRow(
                    title: 'Discount',
                    value: '-₹18.75',
                  ),
                  OrderSummaryRow(
                    title: 'Shipping',
                    value: '₹100.00',
                  ),
                  OrderSummaryRow(
                    title: 'Taxes',
                    value: '₹0.00',
                  ),
                  const Divider(),
                  OrderSummaryRow(
                    title: 'Total',
                    value: '₹356.25',
                    isTotal: true,
                  ),
                  getHeight(height: 10.0),
                  getRegularBodyText(
                    text: 'You saved ₹18.75',
                      fontColor: Colors.grey,
                      fontSize: 16.0,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getRegularBodyText(
                   text: 'Customer information',
                      fontSize: 20.0,

                  ),
                  getHeight(height: 20.0),
                  // Add customer information details here
                  // Example:
                  CustomerInfoRow(
                    title: 'Name',
                    value: 'Sparks',
                  ),
                  CustomerInfoRow(
                    title: 'Email',
                    value: 'sparks@example.com',
                  ),
                  CustomerInfoRow(
                    title: 'Phone',
                    value: '+1234567890',
                  ),
                  CustomerInfoRow(
                    title: 'Shipping Address',
                    value: '123 Shipping St, City, Country',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}

class OrderSummaryItem extends StatelessWidget {
  final String title;
  final String variant;
  final String price;

  OrderSummaryItem({
    required this.title,
    required this.variant,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getRegularBodyText(
         text: title,
            fontSize: 16.0,
        ),
        getHeight(height: 5.0),
        getRegularBodyText(
         text :variant,
            fontColor: Colors.grey,
        ),
        getHeight(height: 5.0),
        getRegularBodyText(
          text:price,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

class OrderSummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;

  OrderSummaryRow({
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getRegularBodyText(
         text: title,
            fontSize: 16.0,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,

        ),
        getRegularBodyText(
        text:  value,
            fontSize: 16.0,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
      ],
    );
  }
}

class CustomerInfoRow extends StatelessWidget {
  final String title;
  final String value;

  CustomerInfoRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getRegularBodyText(
         text: title,
            fontSize: 16.0,
        ),
        getHeight(height: 5.0),
        getRegularBodyText(
          text:value,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,

        ),
      ],
    );
  }
}

